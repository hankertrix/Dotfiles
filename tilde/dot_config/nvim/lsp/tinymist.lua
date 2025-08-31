-- Configuration for tinymist
return {
	settings = {
		formatterMode = "typstyle",
		exportPdf = "onType",
		formatterIndentSize = 4,
		formatterPrintWidth = require("shared_configs").max_line_length,
		formatterProseWrap = true,
		lint = {
			enabled = true,
		},
	},
}
