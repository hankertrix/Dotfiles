// ==UserScript==
// @name         Block Telegram auto scroll
// @version      0.1
// @description  Stops Telegram from auto scrolling after a message is sent
// @author       Hankertrix
// @match        https://web.telegram.org/*
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  // The maximum delay in milliseconds
  // after the message is sent to block the scroll
  const MAX_DELAY_MS = 1000;

  // The keys that send the message
  const KEYS_TO_SEND_MESSAGE = ["Enter"];

  // The send buttons
  const SEND_BUTTONS = {
    webK: ".btn-send",
    webA: ".main-button",
  };

  // The input elements
  const INPUT_ELEMENTS = {
    webK: ".input-message-input.forwards",
    webA: "#editable-message-text",
  };

  // The chat window
  const CHAT_WINDOWS = {
    webK: ".bubbles-scrollable",
    webA: ".MessageList",
  };

  // The regular expression to remove the . and # from the selector
  const REMOVE_SELECTOR_REGEX = /^[.#]+|[.#]$/g;

  // The scrollTop property
  const SCROLL_TOP = "scrollTop";

  // Initialise the message sent time
  let messageSentTime = 0;

  // The event listener for the button
  function updatePreviousState() {

    // Set the message sent time
    messageSentTime = performance.now();
  }

  // Create an observer to watch for changes to the page
  const observer = new MutationObserver(() => {

    // Try to get the button to send the message
    const sendButton = document.querySelector(
      Object.values(SEND_BUTTONS).join(", "),
    );

    // Try to get the input element
    const input = document.querySelector(
      Object.values(INPUT_ELEMENTS).join(", "),
    );

    // If the button exists and
    // the event listener attribute doesn't exist
    if (sendButton && !sendButton.dataset.blockerAdded) {

      // Add the click event listener to it
      sendButton.addEventListener("click", updatePreviousState);

      // Set that the event listener has been added
      sendButton.dataset.blockerAdded = true;
    }

    // If the input element exists and
    // the event listener attribute doesn't exist
    if (input && !input.dataset.blockerAdded) {

      // Add the event listener to update the message sent time
      // when the keys used to send a message are pressed
      input.addEventListener("keydown", event => {
        if (KEYS_TO_SEND_MESSAGE.includes(event.code)) {
          updatePreviousState();
        }
      });

      // Set that the event listener has been added
      input.dataset.blockerAdded = true;
    }
  });

  // Get the prototype of the html element
  const prototype = HTMLElement.prototype;

  // Get the descriptor for the element
  const descriptor =
    Object.getOwnPropertyDescriptor(prototype, SCROLL_TOP) ||
    Object.getOwnPropertyDescriptor(Element.prototype, SCROLL_TOP);

  // Define the getter and setter of the scrollTop property
  Object.defineProperty(prototype, SCROLL_TOP, {

    // Define the getter
    get() {
      return descriptor.get.call(this);
    },

    // Define the setter
    set(value) {

      // Initialise whether the element is the chat window
      let isChatWindow = false;

      // Iterate over all the selectors for the chat window
      for (const selector of Object.values(CHAT_WINDOWS)) {

        // Get the class name
        const className = selector.replace(REMOVE_SELECTOR_REGEX, "");

        // If the class list contains the class name,
        // set that the element is the chat window
        if (this.classList.contains(className)) {
          isChatWindow = true;
        }
      }

      // If the element is not the chat window
      if (!isChatWindow) {

        // Call the original set method
        descriptor.set.call(this, value);

        // Exit the function
        return;
      }

      // console.log("Current value:", descriptor.get.call(this));
      // console.log("Given value:", value);

      // Get whether the send button has been pressed recently
      const sendButtonPressedRecently =
        performance.now() - messageSentTime < MAX_DELAY_MS;

      // If all the above conditions are met,
      // block the scroll by exiting the function
      if (sendButtonPressedRecently) {
        // console.warn("Blocked programmatic scroll");
        return;
      }

      // Use the original set call to set the value
      descriptor.set.call(this, value);
    },

    configurable: true,
    enumerable: descriptor.enumerable,
  });

  // Observe the document body
  observer.observe(document.body, {
    childList: true,
    subtree: true,
  });

  // console.log("Telegram scroll blocker installed");
})();
