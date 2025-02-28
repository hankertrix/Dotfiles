// ==UserScript==
// @name       Bypass All Shortlinks Debloated
// @namespace  Violentmonkey Scripts
// @run-at     document-start
// @author     Amm0ni4
// @noframes
// @version        94.0.22
// @grant          GM_setValue
// @grant          GM_getValue
// @grant          GM_addStyle
// @grant          GM_xmlhttpRequest
// @grant          window.onurlchange
// @grant          GM_registerMenuCommand
// @icon           https://cdn-icons-png.flaticon.com/512/14025/14025295.png
// @require        https://update.greasyfork.org/scripts/439099/1203718/MonkeyConfig%20Modern%20Reloaded.js
// @description    Automatically bypass many link shorteners. Originally by BloggerPemula.
// @homepageURL    https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated
// @supportURL     https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues
// @match *://*.gocmod.com/*
// @match *://*.writedroid.in/*
// @match *://*.web1s.com/*
// @match *://*.modmania.eu.org/*
// @match *://*.diglies.com/*
// @match *://*.vbnmx.online/*
// @match *://*.ruwet.us/*
// @match *://*.autodime.com/*
// @match *://*.fitnesswifi.com/*
// @match *://*.marketrook.com/*
// @match *://*.ahtio.com/*
// @match *://*.switchhindi.com/*
// @match *://*.olhonagrana.com/*
// @match *://*.veganab.co/*
// @match *://*.1apple.xyz/*
// @match *://*.akcartoons.in/*
// @match *://*.blogsward.com/*
// @match *://*.nisnisin.com/*
// @match *://*.poco.rcccn.in/*
// @match *://*.links.rcccn.in/*
// @match *://*.candleoflife.fun/*
// @match *://*.suntechu.in/*
// @match *://*.market.finclub.in/*
// @match *://*.link.sharedp.com/*
// @match *://*.poco.devnote.in/*
// @include /^(https?:\/\/)(.+)?((mewsr|techstudify).com)(\/.*)/
// @match *://*.indirasari.com/*
// @match *://*.wikitraveltips.com/*
// @match *://*.encurtaclik.com/*
// @match *://*.appkamods.com/*
// @match *://*.keepzem.com/*
// @match *://*.short.sharedp.com/*
// @match *://*.earn.tensailab.com/*
// @match *://*.postazap.com/*
// @match *://*.link.devnote.in/*
// @match *://*.mamahawa.com/*
// @match *://*.shakib.quick91.com/*
// @match *://*.reminimod.co/*
// @match *://*.indiamaja.com/*
// @match *://*.tbhlabsnews.com/*
// @match *://*.interestingfactsare.com/*
// @match *://*.djnonstopmusic.in/*
// @match *://*.travelagancy.com/*
// @include /^(https?:\/\/)(.+)?(newshuta.in|60fpspubg.one)(\/.*)/
// @match *://*.tech.filohappy.in/*
// @match *://*.kelasadsense.com/*
// @match *://*.trust.bgmi32bitapk.in/*
// @match *://*.news.topsarkariyojana.in/*
// @include /^(https?:\/\/)(.+)?((cyberlynews|quizrent).com)(\/.*)/
// @match *://*.cafe.warrenrahul.in/*
// @match *://*.earn.bankshiksha.in/*
// @match *://*.techurlshort.in/*
// @match *://*.ninjamodz.litonmods.com/*
// @match *://*.onlinerecruiters.in/*
// @match *://*.earnmoneyyt.com/*
// @match *://*.kingyojana.com/*
// @match *://*.sayphotobooth.com/*
// @match *://*.odiadance.com/*
// @match *://*.rajdhanimaja.com/*
// @match *://*.highkeyfinance.com/*
// @match *://*.financeyogi.net/*
// @match *://*.finance.marketrook.com/*
// @include /^(https?:\/\/)(.+)?((gam3ah|m4cut|soft3arbi|elmokhbir|fatednews|itechmafiia).com)(\/.*)/
// @match *://*.newkhabar24.com/*
// @include /^(https?:\/\/)(.+)?((diglies|indids).com|cryptings.in)(\/.*)/
// @match *://*.ninjamodz.mtcremix.com/*
// @match *://*.bharatbestdeals.com/*
// @include /^(https?:\/\/)(.+)?(earn.thardekho.com|earn.dinoogaming.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((examnewstoday|kaomojihub).com)(\/.*)/
// @match *://*.earnbox.sattakingcharts.in/*
// @match *://*.a1.payalgaming.co.in/*
// @include /^(https?:\/\/)(.+)?((earnc1.bankshiksha|domain.bgmiupdate.com).in)(\/.*)/
// @include /^(https?:\/\/)(.+)?((moderngyan|jbstudies|punjabworks).com|(payalgaming.co|star.bgmiupdate.com).in)(\/.*)/
// @include /^(https?:\/\/)(.+)?((on-scroll|diudemy|maqal360).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((cryptowidgets|gadgetbuzz|coinsvalue|coinstrend|coinsrise|webfreetools|wanderjourney|languagefluency|giftmagic).net|(freeoseocheck|insurancexguide|funplayarcade|origamiarthub|fitbodygenius|illustrationmaster|selfcareinsights|ecofriendlyz|virtualrealitieshub|brewmasterly).com|coinscap.info|bubblix.eu)(\/.*)/
// @match *://*.linkpay.top/*
// @match *://*.mixrootmods.com/*
// @match *://*.go.link4rev.site/*
// @match *://*.infinityskull.com/*
// @match *://*.link.linksfire.co/*
// @match *://*.dutchycorp.space/*
// @match *://*.paster.gg/*
// @match *://*.ouo.io/*
// @match *://*.linkbox.to/*
// @match *://*.adbtc.top/*
// @match *://*.upload.ee/*
// @match *://*.dayuploads.com/*
// @match *://*.dddrive.me/*
// @match *://*.uppit.com/*
// @match *://*.krakenfiles.com/*
// @match *://*.file-upload.net/*
// @match *://*.hexupload.net/*
// @match *://*.gofile.io/*
// @match *://*.rapidgator.net/*
// @match *://*.dbree.me/*
// @match *://*.dropgalaxy.com/*
// @match *://*.megaupto.com/*
// @match *://*.karanpc.com/*
// @match *://*.douploads.net/*
// @match *://*.dataupload.net/*
// @match *://*.buzzheavier.com/*
// @match *://*.filemoon.sx/*
// @match *://*.dailyuploads.net/*
// @match *://*.bestfonts.pro/*
// @match *://*.uploadev.org/*
// @match *://*.files.fm/*
// @match *://*.megaup.net/*
// @match *://*.mega4upload.net/*
// @match *://*.financemonk.net/*
// @match *://*.adoc.pub/*
// @match *://*.pdfcoffee.com/*
// @match *://*.uploady.io/*
// @match *://*.file-upload.org/*
// @match *://*.up-4ever.net/*
// @match *://*.mexa.sh/*
// @match *://*.hitfile.net/*
// @match *://*.4fnet.org/*
// @match *://*.udrop.com/*
// @match *://*.mp4upload.com/*
// @match *://*.drop.download/*
// @match *://*.workupload.com/*
// @match *://*.send.cm/*
// @match *://*.mega4up.org/*
// @match *://*.uploadhaven.com/*
// @match *://*.k2s.cc/*
// @match *://*.ac.totsugeki.com/*
// @match *://*.anonym.ninja/*
// @match *://*.vosan.co/*
// @match *://*.apkmody.io/*
// @match *://*.mdfx9dc8n.net/*
// @match *://*.takefile.link/*
// @match *://*.appsblaze.com/*
// @match *://*.modcombo.com/*
// @match *://*.1fichier.com/*
// @match *://*.fileresources.net/*
// @match *://*.freepreset.net/*
// @match *://*.doodrive.com/*
// @match *://*.mediafire.com/*
// @match *://*.qiwi.gg/*
// @match *://*.turbobit.net/*
// @match *://*.sharemods.com/*
// @match *://*.leechpub.com/*
// @match *://*.rawlazy.si/*
// @match *://*.downloader.tips/*
// @match *://*.modsbase.com/*
// @match *://*.filedm.com/*
// @match *://*.4shared.com/*
// @match *://*.megaurl.win/*
// @match *://*.keeplinks.org/*
// @match *://*.earnlink.io/*
// @match *://*.mkomsel.com/*
// @match *://*.onimports.com.br/*
// @match *://*.1shortlink.com/*
// @match *://*.jameeltips.us/*
// @match *://*.post.copydev.com/*
// @match *://*.1short.io/*
// @match *://*.linegee.net/*
// @match *://*.pro.sh/*
// @match *://*.playpaste.com/*
// @match *://*.1bitspace.com/*
// @match *://*.cshort.org/*
// @match *://*.render-state.to/*
// @match *://*.linkpay.cc/*
// @match *://*.kisalt.digital/*
// @match *://*.enlacito.com/*
// @match *://*.firefaucet.win/*
// @match *://*.aryx.xyz/*
// @match *://*.webhostingtips.club/*
// @match *://*.shareus.io/*
// @match *://*.adtival.network/*
// @match *://*.travelinian.com/*
// @match *://*.sharetext.me/*
// @match *://*.comohoy.com/*
// @match *://*.linkforearn.click/*
// @match *://*.apkw.ru/*
// @match *://*.programasvirtualespc.net/*
// @match *://*.fansonlinehub.com/*
// @match *://*.setroom.biz.id/*
// @match *://*.lksfy.com/*
// @match *://*.terabox.fun/*
// @match *://*.karyawan.co.id/*
// @match *://*.icerik.site/*
// @match *://*.ponselharian.com/*
// @match *://*.assettoworld.com/*
// @match *://*.adfoc.us/*
// @match *://*.oii.io/*
// @match *://*.1link.club/*
// @match *://*.slink.bid/*
// @match *://*.blog.yurasu.xyz/*
// @match *://*.zegtrends.com/*
// @match *://*.bigbtc.win/*
// @match *://*.linkspy.cc/*
// @match *://*.chainfo.xyz/*
// @match *://*.100puan.com/*
// @match *://*.sub2get.com/*
// @match *://*.go.shareus.in/*
// @match *://*.leitup.com/*
// @match *://*.coinsrev.com/*
// @match *://*.newassets.hcaptcha.com/*
// @match *://*.mazen-ve3.com/*
// @match *://*.soft3arbi.com/*
// @match *://*.o-pro.online/*
// @match *://*.linkatla.com/*
// @match *://*.claimfreetrx.online/*
// @match *://*.easylink.gamingwithtr.com/*
// @match *://*.onlinetechsolution.link/*
// @match *://*.playnano.online/*
// @match *://*.rekonise.com/*
// @match *://*.acortalink.me/*
// @match *://*.amritadrino.com/*
// @match *://*.socialwolvez.com/*
// @match *://*.bitcotasks.com/*
// @match *://*.suaurl.com/*
// @match *://*.letsboost.net/*
// @match *://*.shortit.pw/*
// @match *://*.ify.ac/*
// @match *://*.lanza.me/*
// @match *://*.lifeezee.com/*
// @match *://*.lolinez.com/*
// @match *://*.file-upload.in/*
// @match *://*.linksly.co/*
// @match *://*.appsinsta.com/*
// @match *://*.apkadmin.com/*
// @match *://*.sugarona.com/*
// @match *://*.cekip.site/*
// @match *://*.amanguides.com/*
// @match *://*.8tm.net/*
// @match *://*.cpmlink.net/*
// @match *://*.noodlemagazine.com/*
// @match *://*.paycut.pro/*
// @match *://*.mohtawaa.com/*
// @match *://*.rockmods.net/*
// @match *://*.boost.ink/*
// @match *://*.blog.textpage.xyz/*
// @match *://*.foodupe.com/*
// @match *://*.mirrored.to/*
// @match *://*.sub2unlock.net/*
// @match *://*.mboost.me/*
// @match *://*.autofaucet.dutchycorp.space/*
// @include /^(https?:\/\/)(.+)?((teachsansar|technicalatg|foodxor).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(appdrive\.*)/
// @include /^(https?:\/\/)(.+)?(userscloud.com|dosya.co)(\/.*)/
// @include /^(https?:\/\/)(.+)?(usersdrive.com|ddownload.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(up-load.io|downloadani.me)(\/.*)/
// @include /^(https?:\/\/)(.+)?(oxy\.*)/
// @include /^(https?:\/\/)(.+)?(hxfile.co|ex-load.com|megadb.net)(\/.*)/
// @include /^(https?:\/\/)(.+)?((uploadrar|fingau|getpczone|wokaz).com|uptomega.me)(\/.*)/
// @include /^(https?:\/\/)(.+)?((kusonime|oploverz).org|(opinimedia|beritaotaku|caramasak).com|otakudesu.cc|resepkoki.net|neonime\.*)/
// @include /^(https?:\/\/)(.+)?(clickndownload.org|clicknupload\.*)/
// @include /^(https?:\/\/)(.+)?((thecubexguide|miuiflash).com|(djxmaza|jytechs).in)(\/.*)/
// @include /^(https?:\/\/)(.+)?(1ink.cc|cuturl.cc)(\/.*)/
// @include /^(https?:\/\/)(.+)?(bedrat.xyz|uhtrdr47.online)(\/.*)/
// @include /^(https?:\/\/)(.+)?(proappapk.com|meclipstudy.in)(\/.*)/
// @include /^(https?:\/\/)(.+)?(offerwall.me|ewall.biz)(\/.*)/
// @include /^(https?:\/\/)(.+)?(cooklike.info|model-tas-terbaru.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(bildirim.in|bildirim.eu|bildirim.link)(\/.*)/
// @include /^(https?:\/\/)(.+)?(uptobhai\.*|uplinkto\.*|shortlinkto\.*)/
// @include /^(https?:\/\/)(.+)?(michaelemad.com|7misr4day.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(tii.la|oei.la|iir.la|tvi.la|oii.la|tpi.li|lnbz.la)(\/.*)/
// @include /^(https?:\/\/)(.+)?((bnbfree|freeth|freebitco).in)(\/.*)/
// @include /^(https?:\/\/)(.+)?(cutnet.net|(exego|cety).app|(jixo|jizo|gamco).online|cutyion.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(khaddavi.net|contentmenarik.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(gobits.me|zcash.one|clickscoin.com|beycoin.xyz|bitsusdt.com|adsluffa.online)(\/.*)/
// @include /^(https?:\/\/)(.+)?(sfl.gl|moneyblink.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((fourlinez|newsonnline|phonesparrow|creditcarred).com|(alljntuworld|updatewallah).in)(\/.*)/
// @include /^(https?:\/\/)(.+)?((newsbawa|utkarshonlinetest|techbezzie|financewada).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((blackleadr|shortcuthigh|newztalkies|cybertyrant).com|hubdrive.me|fileroot.net|nzarticles.pro)(\/.*)/
// @include /^(https?:\/\/)(.+)?((10short|lollty).pro|mamahawa.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((aduzz|tutorialsaya|indobo|baristakesehatan|merekrut).com|deltabtc.xyz|bit4me.info)(\/.*)/
// @include /^(https?:\/\/)(.+)?(cryptfaucet.com|izseo.net)(\/.*)/
// @include /^(https?:\/\/)(.+)?((cryptosparatodos|placementsmela|howtoconcepts|tuasy|skyrimer|foodxor|yodharealty|mobcupring).com|(paidinsurance|sevayojana).in|zaku.pro)(\/.*)/
// @include /^(https?:\/\/)(.+)?((howifx|vocalley|financerites|yogablogfit|healthfirstweb|junkyponk|mythvista|blog-myst|webhostsec).com|ss7.info|sololevelingmanga.pics)(\/.*)/
// @include /^(https?:\/\/)(.+)?((viralxns|uploadsoon).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(ouo.io|ouo.press)(\/.*)/
// @include /^(https?:\/\/)(.+)?(largestpanel.in|earnme.club|usanewstoday.club)(\/.*)/
// @include /^(https?:\/\/)(.+)?(paste1s.com|note1s.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(yoshare.net|olhonagrana.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(mrproblogger.com|themezon.net)(\/.*)/
// @include /^(https?:\/\/)(.+)?(forex-golds.com|forex-trnd.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(coincroco.com|surflink.tech)(\/.*)/
// @include /^(https?:\/\/)(.+)?(solidcoins.net|fishingbreeze.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((superheromaniac|spatsify|mastkhabre|ukrupdate).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(4hi.in|shortie.sbs|10short.com|finish.wlink.us)(\/.*)/
// @include /^(https?:\/\/)(.+)?((fc-lc|loaninsurehub).com|fc-lc.xyz)(\/.*)/
// @include /^(https?:\/\/)(.+)?(infonerd.org|coingraph.us)(\/.*)/
// @include /^(https?:\/\/)(.+)?((blogmado|kredilerim|insuranceleadsinfo).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(azmath.info|expertvn.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((ez4mods|tensailab|game5s|supermodsmenus).com|tech5s.co)(\/.*)/
// @include /^(https?:\/\/)(.+)?((coinsward|blogsward).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((tmail|labgame).io|(gamezizo|fitdynamos).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((exeo|exego).app|(falpus|exe-urls).com|4ace.online)(\/.*)/
// @include /^(https?:\/\/)(.+)?((forexrw7|forex-articles|3rabsports|fx-22|watchtheeye|mooonten).com|gold-24.net|(offeergames|todogame|asxwq).online|msic.site)(\/.*)/
// @include /^(https?:\/\/)(.+)?((kongutoday|proappapk|hipsonyc|teamtechnews).com|yotrickslog.tech)(\/.*)/
// @include /^(https?:\/\/)(.+)?(writedroid.eu.org|modmania.eu.org|writedroid.in)(\/.*)/
// @include /^(https?:\/\/)(.+)?((travelironguide|businesssoftwarehere|softwaresolutionshere|freevpshere).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(adclicker\.*|yourihollier.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((mgame|sportweb|bitcrypto).info)(\/.*)/
// @include /^(https?:\/\/)(.+)?((horoscop|videoclip).info|article24.online|writeprofit.org|docadvice.eu|trendzilla.club)(\/.*)/
// @include /^(https?:\/\/)(.+)?(coinhub.wiki|(vitalityvista|geekgrove).net)(\/.*)/
// @include /^(https?:\/\/)(.+)?(stly.link|snaplessons.net|atravan.net|stfly.biz|airevue.net)(\/.*)/
// @include /^(https?:\/\/)(.+)?((mangareleasedate|freemodapp|zutiza|phixshop|uskloans|sabkiyojana|dulimo|merikahaniya|kloota|nspaconline|etrovo).com|(myfirstname|ignoupur).in|sarkarisahayata.org|kisannews.net|bloxstrap.cc|90fpsbgmi.one)(\/.*)/
// @include /^(https?:\/\/)(.+)?((remixsounds|helpdeep|thinksrace).com|uprwssp.org)(\/.*)/
// @include /^(https?:\/\/)(.+)?(shrinke\.*|shrinkme\.*|(paid4link|linkbulks|linclik|up4cash|smoner|atglinks).com|(wordcounter|shrink).icu|(dutchycorp|galaxy-link).space|dutchycorp.ovh|pahe.plus|(pwrpa|snipn).cc|paylinks.cloud|oke.io|tinygo.co|tlin.me)(\/.*)/
// @include /^(https?:\/\/)(.+)?(revly.click|mitly.us)(\/.*)/
// @include /^(https?:\/\/)(.+)?(trangchu.news|downfile.site|(techacode|expertvn|ziggame).com|azmath.info|expertvn.com|aztravels.net|top10cafe.se|handydecor.com.vn)(\/.*)/
// @include /^(https?:\/\/)(.+)?((askpaccosi|wellness4live|akash.classicoder).com|2the.space|inicerita.online|cryptomonitor.in)(\/.*)/
// @include /^(https?:\/\/)(.+)?((hosttbuzz|policiesreview|blogmystt|wp2hostt|advertisingcamps).com|clk.kim|dekhe.click)(\/.*)/
// @include /^(https?:\/\/)(.+)?(techyreviewx.com|desiupload.co)(\/.*)/
// @include /^(https?:\/\/)(.+)?((blogsward|coinjest).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(exactpay.online|neverdims.com|sproutworkers.co|coinsfaucet.fun)(\/.*)/
// @include /^(https?:\/\/)(.+)?((btcpany|zombiebtc|claimfey|thefastpost).com|(panytourism|statepany).online)(\/.*)/
// @include /^(https?:\/\/)(.+)?(tutwuri.id|(besargaji|link2unlock).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?(hunterkiller.me|surflink.tech)(\/.*)/
// @include /^(https?:\/\/)(.+)?((lyricsbaazaar|ezeviral).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((sekilastekno|miuiku|vebma|majalahhewan).com|crm.cekresi.me|ai.tempatwisata.pro)(\/.*)/
// @include /^(https?:\/\/)(.+)?((mobi2c|healthy4pepole|healdad|world2our|mobitaak|te-it|businessnews-nigeria|govaf|fahmysport).com|(hightrip|fx-gd|world-trips|otechno|bluetechno|to-travel).net|(newforex|forexit).online)(\/.*)/
// @include /^(https?:\/\/)(.+)?(oncoin.info|nishankhatri.com.np|quanngon.org)(\/.*)/
// @include /^(https?:\/\/)(.+)?(playonpc.online|quins.us|(retrotechreborn|insurelean|ecosolardigest).com|gally.shop)(\/.*)/
// @include /^(https?:\/\/)(.+)?(short.croclix.me|adz7short.space)(\/.*)/
// @include /^(https?:\/\/)(.+)?(adshnk.com|adshrink.it)(\/.*)/
// @include /^(https?:\/\/)(.+)?(techleets.xyz|sharphindi.in)(\/.*)/
// @include /^(https?:\/\/)(.+)?(xonnews.net|toilaquantri.com|share4u.men|camnangvay.com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((cricketgurupro|travelkuku).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((financenube|mixrootmods|pastescript|trimorspacks|mealcold).com)(\/.*)/
// @include /^(https?:\/\/)(.+)?((disheye|kreatifparenting|phimne|admediaflex|cdrab).com|(gurumu|wpcheap|izseo|adcrypto|daycash).net|(ecq|oncoin).info|savego.org|hbz.us|(djqunjab|alpha-links).in|datacheap.io)(\/.*)/
// @include /^(https?:\/\/)(.+)?(mbantul.my.id|crypto-fi.net|claimcrypto.cc|xtrabits.click|(cempakajaya|web9academy|onlineincoms|allsoftdrivers|tribuncrypto|poketoonworld|bioinflu|pubgquotes|bico8).com|(techleets|ourcoincash|studyis|healthysamy).xyz)(\/.*)/
// @match *://*.api.gplinks.com/*
// @match *://*.venzoars.com/*
// @match *://*.stockinsights.in/*
// @include /^(https?:\/\/)(.+)?((surfsees|travelagancy).com)(\/.*)/
// @match *://*.multiup.org/*
// @match *://*.modsfire.com/*
// @match *://*.social-unlock.com/*
// @match *://*.uii.io/*
// @match *://*.shortano.link/*
// @match *://*.shortino.link/*
// @match *://*.clk.st/*
// @match *://*.clicksfly.com/*
// @match *://*.tryshort.in/*
// @match *://*.dailytime.store/*
// @match *://*.ez4short.com/*
// @match *://*.fc.lc/*
// @match *://*.cutp.in/*
// @match *://*.saly.io/*
// @match *://*.earnow.online/*
// @match *://*.gplinks.in/*
// @match *://*.linkfly.me/*
// @match *://*.linksfire.co/*
// @match *://*.adlink.click/*
// @match *://*.linkjust.com/*
// @match *://*.linkbulks.com/*
// @match *://*.traffic1s.com/*
// @match *://*.link4rev.site/*
// @match *://*.linkrex.net/*
// @match *://*.opli.xyz/*
// @match *://*.ninjaurl.net/*
// @match *://*.shortyearn.com/*
// @match *://*.upshrink.com/*
// @match *://*.tr.link/*
// @match *://*.megaurl.in/*
// @match *://*.adshort.co/*
// @match *://*.atglinks.com/*
// @match *://*.shrinkforearn.in/*
// @match *://*.shorti.io/*
// @match *://*.try2link.com/*
// @match *://*.terafly.me/*
// @match *://*.www.wts.pw/*
// @match *://*.clk.sh/*
// @match *://*.rocklinks.net/*
// @match *://*.megafly.in/*
// @match *://*.usalink.io/*
// @match *://*.adrinolinks.in/*
// @match *://*.10short.com/*
// @match *://*.urlpay.in/*
// @match *://*.mdiskshortner.link/*
// @match *://*.cbshort.com/*
// @match *://*.droplink.co/*
// @match *://*.paid4link.com/*
// @match *://*.cuty.io/*
// @match *://*.doshrink.com/*
// @match *://*.revly.click/*
// @match *://*.shrinkearn.com/*
// @match *://*.shrinkme.io/*
// @match *://*.shortox.com/*
// @match *://*.linksfly.link/*
// @match *://*.ay.live/*
// @match *://*.urlstox.com/*
// @match *://*.gamerfang.in/*
// @match *://*.blog.mphealth.online/*
// @match *://*.mphealth.online/*
// @match *://*.shrs.link/*
// @match *://*.www.gifans.com/*
// @match *://*.www.pythondunyasi.com/*
// @match *://*.jrlinks.in/*
// @match *://*.hr.vikashmewada.com/*
// @match *://*.freeltc.top/*
// @match *://*.freecrypto.top/*
// @match *://*.insfly.pw/*
// @match *://*.Insfly.pw/*
// @match *://*.clockads.in/*
// @match *://*.exashorts.fun/*
// @match *://*.videolyrics.in/*
// @match *://*.adnews.me/*
// @match *://*.kyshort.xyz/*
// @match *://*.eazyurl.xyz/*
// @match        https://acortalink.me/*
// @match         *://bleleadersto.com/s?*
// @match         *://tonordersitye.com/s?*
// @match         *://daughablelea.com/s?*
// @match         *://mdlinkshub.com/s?*
// @match         *://linkvertise.com/*
// @match        *://bstlar.com/*
// @match        https://bypass.city/bypass?bypass=*
// @match        https://adbypass.org/bypass?bypass=*
// @match       https://fc-lc.xyz/*
// @match       https://datanodes.to/download
// @match       *://dailyuploads.net/*
// @match       *://www.ryuugames.com/?eroge=*
// @match       *://anchoreth.com/r-adsh?t=i&v=*
// @match       *://*.btcut.io/*
// @match       *://btcut.io/*
// @match       *://linkslice.io/*
// @match       *://zshort.io/*
// @match       *://easy4skip.com/*
// @match        https://paster.so/*
// @include       /^(https?:\/\/)(loot-link.com|loot-links.com|lootlink.org|lootlinks.co|lootdest.(info|org|com)|links-loot.com|linksloot.net)\/s\?.*$/
// @include     /(mundopolo.net|myfirstdollar.net|adsense.tupaste.top|acorta2.com|web.admoneyclick.net|acortaphd.live|onlypc.net|link.manudatos.com)/
// @include     /comohoy.com/
// @include     /privatenudes.com\/model/
// @include     /sphinxanime.com\/short/
// @include     /japanpaw.com\/out/
// @include     /(iconicblogger.com|segurosdevida.site)/
// @include     /link.unlockner.com/
// @include     /(cybercityhelp|akcartoons).in/
// @include     /www.akcartoons.in/
// @include     /go.moonlinks.in/
// @include     /shrinkme.(us|site|cc|vip|dev|ink)/
// @include     /test.shrinkurl.org/
// @include     /shareus.io/
// @include     /shareus\.io\/go\?sid=/
// @include     /(verpeliculasonline.org|subtituladas.com)\/enlace/
// @include     /links.cuevana.ac\/short/
// @include     /ouo.io/
// @include     /exeo.app|mrgec.com|cety.app|cuty.me/
// @include     /1v.to\/t/
// @include     /linkspy.cc\/tr/
// @include     /linkspy.cc\/\/a/
// @include     /www.ovagames.com\/.*\.html$/
// @include     /((infytips|remixodiadj|bgmiaimassist).in|(cybertyrant|profitshort|technorozen|bestadvise4u|newztalkies|aiotechnical|cryptonewzhub|techvybes|wizitales|101desires|gdspike|caronwhaley|maxxfour|thewizitale|inventoryidea|gamerxyt|betsatta|stockwallah|gtxhosty|anyrojgar).com|mphealth.online|hubdrive.me|advisecreate.fun|courselinkfree.us|10desires.(org|net)|theapknews.shop|trendzguruji.me|speedynews.xyz|nzarticles.pro|offerboom.top|kvkparbhani.org)/
// @include     /dropgalaxy.(com|co)\/drive/
// @include     /short-ly.co/
// @include     /uqozy.com|posterify.net|drinkspartner.com|manishclasses.in|boiscd.com/
// @include     /blogging.techworldx.net|10beasts.biz/
// @include     /starsddl.me\/short/
// @include     /(tech|technews).unblockedgames.world/
// @include     /seriezloaded.com.ng\/sl-download\/\?link=/
// @include     /www.itscybertech.com/
// @include     /thegadgetking.in/
// @include     /^(https?:\/\/)(?!(bypass.city|adbypass.org))(linkvertise.com|(linkvertise|link-to).net)/
// @include     /^(https?:\/\/)(?!(bypass.city|adbypass.org))(free-content.pro|(ebaticalfel|downbadleaks|megadropsz|megadumpz|stownrusis|iedprivatedqu|megaspremium|premiumstashdrop|teenspremium|utopianleaks|kmendation|eofmukindwo|realiukzemydre|daughablelea|tonordersitye|bleleadersto).com)|best-links.org\/s\?/
// @include     /^(https?:\/\/)(?!(bypass.city|adbypass.org))(loot-link.com|loot-links.com|lootlink.org|lootlinks.co|lootdest.(info|org|com)|links-loot.com|linksloot.net)\/s\?.*$/
// @include     /epicload.com\/files/
// @include     /www.gtaall.com\/get-manual/
// @include     /woowebtools.com|pallabmobile.in/
// @include     /doodrive.com\/f/
// @include     /ipamod.com\/redirect-to/
// @include     /9xflix\.(\w+)\/m\/goto/
// @include     /bookszone.in/
// @include     /yoshare.net/
// @include     /blog.disheye.com/
// @include     /reminimod.co/
// @include     /techrayzer.com/
// @include     /techfizia.com/
// @include     /tech5s.co/
// @include     /ez4mods.com/
// @include     /ez4short.com|zshort.io/
// @include     /learnmany.in/
// @include     /lksfy.in/
// @include     /droplink.co/
// @include     /lnks.primarchweb.in/
// @include     /highkeyfinance.com/
// @include     /toonhub4u.net\/redirect\/main.php\?url=/
// @include     /toonhub4u\.net\/([^\/]+)\/$/
// @include     /mdsuuniversity.org|instander.me|jameen.xyz|dhamakamusic.ink|eternalcbse.i|financialstudy.me|(foreverhealth|newzwala.co|nhmgujarat|jobkijankari|jobwaala|learnwithsaif|lyricsx|smartsetkari|theringtonesworld|recruitmentrasta|mediniweb|pmyojanasarkari|netflixvip|mghindinews|gentletrail|w3hindi|ryzenmusic).in|(anumin|awolio|cgbsesupport|gptproguide|iplquotes|kaisekareblog|minijankari|news36tech|newsloti|odiamusicsong|sugargliderfaqs|picassoappk|geniuseducares|ndlifestylego|raidersixgameapk|sarkariexam365|potter-world|jankari4u|trancebazar|taazaalerts).com/
// @include     /aipebel.com/
// @include     /raretoonsindia.rtilinks.com/
// @include     /(do|fast).rtilinks.com/
// @include     /vidhidepro.com\/d/
// @include     /www.mirrored.to\/files\/(?!.*\?hash=)/
// @include     /skyve.io/
// @include     /(itradercoin|nichapk|easyworldbusiness|riveh).com/
// @include     /blog.filepresident.com/
// @include     /gyanigurus.net\/view/
// @include     /mkvmoviespoint.casa\/goto/
// @include     /w.linkspoint.net/
// @include     /kingshortener.com/
// @include     /gdslink.xyz/
// @include     /financeyogi.net/
// @include     /jrlinks.in/
// @include     /go.tnshort.net/
// @include     /www.4fnet.org\/goto/
// @include     /(linkmo.net|adpayl.ink)\/[^?]+\?data=.+$/
// @include     /musicc.xyz/
// @include     /(cravesandflames|codesnse|cloutgist).com/
// @include     /go.(cravesandflames|codesnse|cloutgist).com/
// @include     /empebau.eu\/s/
// @include     /cpmlink.net\/go/
// @include     /10short.com/
// @include     /zegtrends.com/
// @include     /icutlink.com/
// @include     /motakhokhara.blogspot.com/
// @include     /xpshort.com/
// @include     /jobzspk.xyz/
// @include     /urls.cx/
// @include     /sunci.net/
// @include     /(adclicker.(io|info)|(discoveryultrasecure|yourihollier).com)\/url/
// @include     /antonimos.de|tiktokcounter.net|tiktokrealtime.com|tpayr.xyz|quesignifi.ca|lifgam.online|waezf.xyz|ashrfd.xyz/
// @include     /minimilionario.com\/noticia.php\?token=/
// @include     /usandoapp.com/
// @include     /v2links.(com|me)/
// @include     /(newsbawa|utkarshonlinetest|techbezzie|financewada).com/
// @include     /techtnet.com/
// @include     /asideway.com/
// @include     /web1s.asia\/api-mode/
// @include     /(linkvip|blitly).io/
// @include     /^https:\/\/megalink.pro\/[a-zA-Z0-9]+$/
// @include     /lnbz.la/
// @include     /dekhe.click|indianshortner.com|lnbz.la|oii.la|falpus.com|4ace.online|tii.la|oko.sh|tpi.li|shrinke.me|clk.(wiki|kim)|techy.veganab.co|atglinks.com|linx.cc|get.megaurl.in|wordcounter.icu|exeo.app|pwrpa.cc|(go|get).megafly.in|birdurls.com|blog.graphicuv.com|try2link.com|owllink.net|oei.la|exego.app|link.theflash.eu.org|get.instantearn.in|mrproblogger.com|exe-urls.com|linkjust.com/
// @include     /ez4short.com\/[^\/]+\/\?token=[^\/]+$/
// @include     /shon.xyz/
// @include     /veganab.co\/\?link=/
// @include     /veganab.co/
// @include     /camdigest.com/
// @include     /tawda.xyz\/tag/
// @include     /pastebin.com\/raw/
// @include     /spacetica.com/
// @include     /linegee.net/
// @include     /(loanoffering|djmp3world).in|moonplusnews.com/
// @include     /4hi.in/
// @include     /lnk.news/
// @include     /imagereviser.com/
// @include     /upshrink.com/
// @include     /bangclinic.life/
// @include     /dow-dow-dow-dow-dow.xyz\/download\/\?id=/
// @include     /ofilmetorrent.com\/download\/\?id=/
// @include     /librospdfgratismundo.net/
// @include     /besargaji.com/
// @include     /moneyblink.com\/ready\/go\?u=/
// @include     /dw-anime.net\/short\/\?anonym=/
// @include     /fiuxy2.co\/threads/
// @include     /megalinks.info\/index.php\?v=/
// @include     /ocultandoo.blogspot.com/
// @include     /rodimalam.com/
// @include     /platinsport.com/
// @include     /(ay.live|aylink.co|gitlink.pro)\/[^\/]+$/
// @include     /(lopteapi.com|1link.vip|blitly.io|web1s.com|megalink.pro)\/[^\/]+$/
// @include     /short-url.link\/[^\/]+$/
// @include     /urlx.one\/[^\/]+$/
// @include     /trimorspacks.com|pastescript.com|updrop.link/
// @include     /earnmoneyyt.com/
// @include     /sheralinks.com/
// @include     /go.bloggingaro.com/
// @include     /land.povathemes.com/
// @include     /pahe.plus/
// @include     /www.(sinsitio.site|dixva.com)\/code\/\?go=/
// @include     /www.yitarx.com/
// @include     /myshrinker.com/
// @include     /thotpacks.xyz/
// @include     /tumangasdd.com/
// @include     /sexyforums.com\/redirect/
// @include     /forum.(sexyegirls|sorrymother).to\/redirect\?to=/
// @include     /paste.japan-paw.net\/\?v=/
// @include     /pastesmkv.xyz\/\?v=/
// @include     /ikramlar.online|segurosdevida.site/
// @include     /mh.gourlpro.com/
// @include     /playpastelinks.com/
// @include     /stfly.(cc|xyz|biz|me)|stly.link|(techtrendmakers|gadnest|optimizepics|bookbucketlyst).com|(blogbux|blogesque|exploreera|explorosity|trekcheck|torovalley|travize|metoza|techlike|crenue|atravan|transoa|techmize|snaplessons|airevue).net/
// @include     /ielts-isa.edu.vn/
// @include     /flash.getpczone.com/
// @include     /(surfsees|travelagancy|venzoars|webbooki|pokoarcade|edigitalizes|finquizy).com|(fitnessholic|myindigocard).net|stockinsights.in|pandagamepad.co|techsl.online/
// @include     /cgsonglyricz.in|www.techhubcap.com/
// @include     /cryptings.in|vbnmx.online/
// @include     /techyblogs.in|readytechflip.com/
// @include     /wp2host.com/
// @include     /pahe.win/
// @include     /ontechhindi.com/
// @include     /thelatintwistcafe.com/
// @include     /(newshuta|5ghindi|gujaratalert|mahitimanch|gujmitra).in|(indiamaja|thespotifypremium).com|mtmanagers.pro/
// @include     /mayas.travel|eldiario24hrs.com|comomedir.com|aplicacionpara.org/
// @include     /animesgd.net/
// @include     /tucinehd.com\/links/
// @include     /render-state.to\/download\/\?link=/
// @include     /www.lanoticia.cc/
// @include     /altearnativasa.com/
// @include     /importantclass.com/
// @include     /bebkub.com/
// @include     /kbconlinegame.com/
// @include     /owoanime.com/
// @include     /keedabankingnews.com/
// @include     /secure.moderngyan.com/
// @include     /earnbox.sattakingcharts.in/
// @include     /set.seturl.in/
// @include     /links.kmhd.net/
// @include     /mastramstories.com\/api.php\?api/
// @include     /onlinetntextbooks.com/
// @include     /www.saferoms.com\/\?go=/
// @include     /hdpastes.com\/\?v=/
// @include     /shrinkforearn.in/
// @include     /encurtads.net|financacerta.com/
// @include     /shrtbr.com/
// @include     /dramaday.me\/[^\/]+\/$/
// @include     /^https:\/\/(fitdynamos.com|labgame.io)\/.*$/
// @include     /mobilenagari.com|defencewallah.in/
// @include     /(bgmiupdatehub|novelquote|superheromaniac|jkssbalerts|taazaloans|spatsify|sikhehindime|careersides).com|(sabarpratham|pubprofit|sarkariyojnaa|reliablesp).in|dear-lottery.org/
// @include     /rocklinks.in/
// @include     /www.udlinks.com/
// @include     /techkhulasha.com|blog.bloggerishyt.in/
// @include     /golink.bloggerishyt.in/
// @include     /skillheadlines.in/
// @include     /psccapk.in|secure.bgmiupdate.com.in|money.hustlershub.in|rg.sattakingcharts.in|payalgaming.co.in/
// @include     /www.spaste.com/
// @include     /click.convertkit-mail.com/
// @include     /hubcloud.club\/tg\/go.php\?re=/
// @include     /bgmiaimassist.in|(stockwallah|inventoryidea).com/
// @include     /^https:\/\/relampagomovies\.com\/.+/
// @include     /(shramikcard|pmkisanlists|techishant|cinedesi|thevouz).in|cookad.net|(tejtime24|cyberlynews|quizrent).com/
// @include     /linkshortify.in|lksfy.com/
// @include     /tii.la|oei.la|iir.la|tvi.la|oii.la|tpi.li|lnbz.la/
// @include     /^https:\/\/[^\/]+\/safe\.php\?link=https:\/\/modijiurl\.com\/[^\/]+\/\?mid=.*$/
// @include     /^https:\/\/modijiurl\.com\/[^\/]+\/\?mid=.*$/
// @include     /delpez.com/
// @include     /mendationforc.info/
// @include     /paster.gg/
// @include     /go.zovo.ink/
// @include     /^https:\/\/kisalt\.com\/.*/
// @include     /((ukrupdate|mastkhabre).com|aryx.xyz)/
// @include     /app.link2unlock.com/
// @include     /freemodsapp.in/
// @include     /pandaznetwork.com/
// @include     /(upfiles.app|haxi.online|upfion.com)/
// @include     /app2.olamovies.download\/generate\/\?id=/
// @include     /foodtechnos.in/
// @include     /mixrootmod.com/
// @include     /zaku.pro/
// @include     /aylink.co|cpmlink.pro/
// @include     /hypershort.com/
// @include     /instaserve.net|gomob.xyz|gamechilly.online/
// @include     /(desbloquea|drivelinks).me|(acortame-esto|recorta-enlace|enlace-protegido|super-enlace).com|short-info.link/
// @include     /tech.hipsonyc.com|itijobalert.in/
// @include     /golink.(gyanitheme.com|bloggerishyt.in)/
// @include     /pxanimeurdu.com/
// @include     /techarmor.xyz/
// @include     /get.cloudfam.io/
// @include     /monoschinos.club/
// @include /^(https?:\/\/)(.+)?((actualpost|americanstylo|beautifulfashionnailart|dadinthemaking|glowandglamcorner|listofthis|lobirtech|travelperi|vepiv|seydisehirmansethaber|turkiyertg|tophotelsukraine|balatroltd|tenorminiuk|icryptowin|chronoat|ecoinfotec|bcsclass|mainitbd|newselab|dizok|uzaay|tophistoryview|9sblog|ubnem|techavash|6harfli|professionaley|playghub|apkvmod|apkallworld|techoflix|toplistee|games2mobile|nivtu|bflig|jplna|bilgilendirici|zoninews|smoplay|m-womenstyle|bnirfinance|fuyde).com|(makego|sakazi|momge|englishgrammarpro|arab-plus).net|askerlikforum.com.tr|misterio.ro|(forp|bevery|fanuze).xyz|gamcabd.org|gamerking.shop)(\/.*)/
// @include     /(mega-enlace|acortados).com/
// @include     /^https:\/\/(.*\.|)(playonpc.online|quins.us|(retrotechreborn|insurelean|ecosolardigest).com|gally.shop|qanin.xyz|evegor.net)\/.*/
// @include     /quickeemail.com/
// @exclude /^(https?:\/\/)([^\/]+\.)?((github|aliyun|reddit|bing|yahoo|microsoft|whatsapp|amazon|ebay|payoneer|paypal|skrill|stripe|tipalti|wise|discord|tokopedia|taobao|taboola|aliexpress|netflix|citigroup|spotify|bankofamerica|hsbc|blogger|accounts.youtube|(cloud|mail|translate|analytics|accounts|myaccount|contacts|clients6|developers|payments|pay|ogs|safety|wallet).google|atlassian|pinterest|twitter|x|live|facebook|tiktok|instagram|linkedin|fastbull|tradingview|deepseek|chatgpt|openai|playghub|bilibili).com|proton.me|(greasyfork|openuserjs|telegram|wikipedia|lichess).org|doubleclick.net|adoptimum.top|codepen.io|(shopee|lazada|rakuten|maybank|binance).*|(dana|ovo|bca.co|bri.co|bni.co|bankmandiri.co|desa|(.*).go).id|(.*).(edu|gov))(\/.*)/
// @downloadURL https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/raw/branch/main/Bypass_All_Shortlinks.user.js
// @updateURL https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/raw/branch/main/Bypass_All_Shortlinks.meta.js
// ==/UserScript==
// ================================================================================================================================================================
//                                          PLEASE READ SCRIPT INFO BEFORE USE
//                                      PLEASE RESPECT IF MY SCRIPTS USEFUL FOR YOU
//                      DON'T TRY TO COPY PASTE MY SCRIPTS THEN SHARE TO OTHERS LIKE YOU ARE THE CREATOR
//                 PLEASE DON'T REMOVE OR CHANGE MY BLOG, DISABLE YOUR ADBLOCK IN MY BLOG , THANKS FOR YOUR SUPPORT
//              My Blog is Very Important to give some Delay for safe away ,Track New Shortlinks , Broken Bypass etc...
// Thanks so much to @JustOlaf , @Konf , @hacker09 , @juansi , @NotYou , @cunaqr And @Rust1667 for Helping me , make my script even better
//                        Thanks so much to @varram for providing a Great Bypass Site bypass.city and adbypass.org
//                                And also Thank you to everyone who has Contributed with Good Feedback.
// =================================================================================================================================================================
// NOTES
// Popup should be Allowed for render-state.to and coincroco.com sites
// Change Your Delay in the settings options from 5 to 10 or 20 if you have issues like Your action marked Suspicious,Don't try to bypass ,Don't use Speedster, etc

   const window = unsafeWindow; // Some of My Codes Not Running Well Without this , Please Let Me Know if You Find any Bugs
   const cfg = new MonkeyConfig({title: 'Bypass Version 94.0 Settings :', menuCommand: true,
   params: {Announcements : {type: 'text', default: 'Add Your ApiKey from nocaptchaai to use Auto Solve Hcaptcha', long: 3},
    ApiKey: {label: "noCaptcha Ai KEY", type: "text", default: "",},
    SetDelay: {label: "Redirect Delay ", type: "number", default: 5,},
    BlogDelay: {label: "Use My Blogs For Delays", type: "checkbox", default: false,},
    reCAPTCHA: {label: "Auto Open/Solve Recaptcha", type: "checkbox", default: false,}, // Auto Solve Recaptcha Not Yet Ready
    hCaptcha: {label: "Auto Open/Solve Hcaptcha", type: "checkbox", default: false, },
    YTShort: {label: "Disable Youtube Short", type: "checkbox", default: false,},
    RightFC: {label: "Enable Context Menu ", type: "checkbox", default: false,},
    BlockFC: {label: "Enable Always Ready", type: "checkbox", default: false,},
    TimerFC: {label: "Enable Fast Timer ", type: "checkbox", default: false,},
    AutoDL: {label: "Auto Download For Supported Sites", type: "checkbox", default: false,},},});
(function(){function BoostTimers() {const FsT = window.setTimeout; const FsI = window.setInterval;
  Object.defineProperty(window, 'setTimeout', {value: function(func, delay) {if (delay === 1000) {delay = 50;} return FsT.apply(this, arguments);}});
  Object.defineProperty(window, 'setInterval', {value: function(func, delay) {if (delay === 1000) {delay = 50;} return FsI.apply(this, arguments);}});}
  if (cfg.get('TimerFC') == true) {BoostTimers();} else {}})();
(function() { // Please Remember , My Scripts Works Better Using Firefox Browser and Violentmonkey Extension
'use strict';
  const APIKEY = cfg.get('ApiKey'); const bp = query => document.querySelector(query);const BpAll = query => document.querySelectorAll(query);
  const BpParams = new URLSearchParams(location.search);const BpT = query => document.getElementsByTagName(query);const elementExists = query => bp(query) !== null;
  function BpBlock() {return 1;}
  function sleep(ms) {return new Promise((resolve) => setTimeout(resolve, ms));}
  function fakeHidden() {Object.defineProperty(document, "hidden", {get: () => true,configurable: true});}
  function meta(href) {document.head.appendChild(Object.assign(document.createElement('meta'), {name: 'referrer',content: 'origin'}));
    Object.assign(document.createElement('a'), {href}).click();}
  function redirect(url, blog = false) {location = blog && cfg.get('BlogDelay') ? '' + url : url;}
  function BpCalc(sbp) {return (sbp.replace(/\s/g, '').match(/[+\-]?([0-9\.]+)/g) || []).reduce(function(sum, value) {return parseFloat(sum) + parseFloat(value);});}
  function BlockRead(SearchString, nameFunc) {if (!elementExists('body.no-js')) {var target = window[nameFunc]; window[nameFunc] = function(...args) {const stringFunc = String(args);
    if ((new RegExp(SearchString)).test(stringFunc)) args[0] = function() {}; return target.call(this, ...args);};}}
  function DecodeBase64(string, times) {let StringDecoded = string;for (let i = 0; i < times; i++) {StringDecoded = atob(StringDecoded);}return StringDecoded;}
  function setActiveElement(selector) {elementReady(selector).then(element => {const temp = element.tabIndex;element.tabIndex = 0;element.focus();element.tabIndex = temp;});}
  function elementReady(selector) {return new Promise(function(resolve, reject) {let element = bp(selector);
      if (element) {resolve(element); return;} new MutationObserver(function(_, observer) {element = bp(selector);
      if (element) {resolve(element); observer.disconnect();}}).observe(document.documentElement, {childList: true, subtree: true});});}
  function ReadytoClick(selector, sleepTime = 0) {const events = ["mouseover", "mousedown", "mouseup", "click"];const selectors = selector.split(', ');
    if (selectors.length > 1) {return selectors.forEach(ReadytoClick);}if (sleepTime > 0) {return sleep(sleepTime * 1000).then(function() {ReadytoClick(selector, 0);});}
    elementReady(selector).then(function(element) {element.removeAttribute('disabled');element.removeAttribute('target');
        events.forEach(eventName => {const eventObject = new MouseEvent(eventName, {bubbles: true}); element.dispatchEvent(eventObject);});});}
  function strBetween(s, front, back, trim = false) {if (trim) {s = s.replaceAll(' ', '');s = s.trim();s = s.replaceAll('\n', ' ');}
      return s.slice(s.indexOf(front) + front.length, s.indexOf(back, s.indexOf(front) + front.length));}
  function TrustMe() {if (!elementExists('body.no-js')) {const originalAddEventListener = EventTarget.prototype.addEventListener;EventTarget.prototype.addEventListener = function(type, listener, options) {
    const wrappedListener = function(event) {const clonedEvent = Object.create(event);Object.defineProperty(clonedEvent, "isTrusted", {value: true,writable: false});
    return listener.call(this, clonedEvent);};return originalAddEventListener.call(this, type, wrappedListener, options);};}}
  function Decrypter(string, shift = 13) {return string.replace(/[a-z]/gi, c => {const base = c <= 'Z' ? 90 : 122;return String.fromCharCode(base >= (c = c.charCodeAt(0) + shift) ? c : c - 26);});}
  function waitForElm(query, callback, maxWaitTime = 15, initialDelay = 5) {const startTime = Date.now();const maxWaitTimeMs = maxWaitTime * 1000;const initialDelayMs = initialDelay * 1000;
    setTimeout(() => {const observer = new MutationObserver(() => {if (elementExists(query)) {observer.disconnect();callback(bp(query));} else if (Date.now() - startTime >= maxWaitTimeMs + initialDelayMs) {
          observer.disconnect();console.warn(`Element ${query} not found within ${maxWaitTime + initialDelay} seconds`);}});observer.observe(document.body, {childList: true,subtree: true});
      if (elementExists(query)) {observer.disconnect();callback(bp(query));}}, initialDelayMs);}
  function BypassedByBloggerPemula(domains, data, url = '', blog = false, all = false) {if (!new RegExp(domains).test(location.host)) return; if (typeof data === 'function') return data();
    if (typeof data === 'string') {const params = data.split(','); if (params.every(p => BpParams.has(p))) {const use = params[0];
        const value = all ? BpParams.getAll(use).find(u => new RegExp(domains).test(u)) : BpParams.get(use); redirect(url + value, blog);} return;}
    if (Array.isArray(data)) data = {'/': data}; if (!(location.pathname in data)) return; const [key, value] = data[location.pathname];
    if (typeof key === 'object' && key.test(location.search)) return redirect(value + RegExp.$1, blog); if (BpParams.has(key)) redirect(value + BpParams.get(key), blog);}
  function NoFocus() {window.mouseleave = true; window.onmouseover = true; document.hasFocus = function() {return true;}; Object.defineProperty(document, 'webkitVisibilityState', {get() {return 'visible';}});
    Object.defineProperty(document, 'visibilityState', {get() {return 'visible';}}); window.addEventListener('visibilitychange', function(e) {e.stopImmediatePropagation();}, true, true);
    window.addEventListener('focus', onfocus, true);document.addEventListener('visibilitychange', function(e) {e.stopImmediatePropagation();}, true, true); Object.defineProperty(document, 'hidden', {get() {return false;}});}
  function Listener(callback) {if (!elementExists('body.no-js')) {const originalOpen = XMLHttpRequest.prototype.open; XMLHttpRequest.prototype.open = function(method, url) {this.addEventListener("load", function() { this.method = method;this.url = url;callback(this);}); originalOpen.apply(this, arguments);};}}
  function Request(url, options = {}) {return new Promise(function(resolve, reject) {GM_xmlhttpRequest({ method: options.method ?? "GET", url, responseType: options.responseType ?? "json", headers: options.headers, data: options.data, onload: function(response) {resolve(response.response);}});});}
  function RSCookie(action, name, value = null, days = null) {if (action === 'set') {if (!name || value === null) {console.error('Nama cookie dan nilai harus disediakan untuk mode "set".');return;}const date = new Date();date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    const expires = days ? `; expires=${date.toUTCString()}` : '';document.cookie = `${name}=${value}${expires}; path=/`;console.log(`Cookie "${name}" telah diatur dengan nilai "${value}".`);} else if (action === 'read') {
    if (!name) {console.error('Nama cookie harus disediakan untuk mode "read".');return;}const cookieName = name + "=";const decodedCookie = decodeURIComponent(document.cookie);const cookieArray = decodedCookie.split(';');
    for (let i = 0; i < cookieArray.length; i++) {let cookie = cookieArray[i];while (cookie.charAt(0) === ' ') {cookie = cookie.substring(1);}if (cookie.indexOf(cookieName) === 0) {return cookie.substring(cookieName.length, cookie.length);}}return "";} else {console.error('Mode tidak valid. Gunakan "set" atau "read".');}}
  function EnableRCF() {var events = ['contextmenu', 'copy', 'cut', 'paste', 'select', 'selectstart','dragstart', 'drop'];function preventDefaultActions(event) {event.stopPropagation();}events.forEach(function(eventName) {document.addEventListener(eventName, preventDefaultActions, true);});}
  function AIORemover(action, target = null) {switch (action) {case 'removeRef': delete document.referrer;document.__defineGetter__('referrer', () => target || '');console.log('Referrer removed or set to:', target || 'empty');break;
      case 'removeBp': if (!target) {console.error('Selector is required for removeBp action.');return;}var elements = BpAll(target);elements.forEach(element => element.remove());console.log(`Elements with selector "${target}" removed.`);break;
      case 'delCookie': if (!target) {console.error('Cookie name is required for delCookie action.');return;}document.cookie = `${target}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`;console.log(`Cookie "${target}" deleted.`);break; default: console.error('Invalid action. Use "removeRef", "removeBp", or "delCookie".');}}
  function CaptchaDone(callback, checkInterval = 1000) {if (typeof callback !== 'function') {console.error('Callback harus berupa fungsi');return;}let intervalId;
    const checkCaptcha = () => {try {if (elementExists('.iconcaptcha-holder.iconcaptcha-theme-light.iconcaptcha-success')) {clearInterval(intervalId);callback();return;}
    if (elementExists("iframe[src^='https://newassets.hcaptcha.com']")) {if (window.hcaptcha && typeof window.hcaptcha.getResponse === 'function') {const response = window.hcaptcha.getResponse();if (response && response.length > 0) {clearInterval(intervalId);callback();return;}}}
    if (elementExists("input[name='cf-turnstile-response']") && !elementExists('body.no-js')) {if (window.turnstile && typeof window.turnstile.getResponse === 'function') {const response = window.turnstile.getResponse();if (response && response.length > 0) {clearInterval(intervalId);callback();return;}}}
    if (elementExists("iframe[title='reCAPTCHA']")) {if (window.grecaptcha && typeof window.grecaptcha.getResponse === 'function') {const response = window.grecaptcha.getResponse();if (response && response.length > 0) {clearInterval(intervalId);callback();return;}}}} catch (error) {console.error('Error checking captcha:', error);}};intervalId = setInterval(checkCaptcha, checkInterval);}
  function CheckVisibility(selector, operatorOrCallback, textCondition, callback) {function isElementVisible(elem) {if (!elem) return false;if (!elem.offsetHeight && !elem.offsetWidth && !elementExists('body.no-js')) return false;if (getComputedStyle(elem).visibility === 'hidden' && !elementExists('body.no-js')) return false;return true;}
      function checkTextCondition(textCondition) {try {const [selectorPart, expectedValue] = textCondition.split(/(==|!=)/).map(part => part.trim());const selector = selectorPart.replace("bp('", "").replace("').innerText", "");const elem = bp(selector);if (!elem) return false;const actualValue = elem.innerText.trim();
      if (textCondition.includes('==')) {return actualValue === expectedValue.replace(/['"]/g, '');} else if (textCondition.includes('!=')) {return actualValue !== expectedValue.replace(/['"]/g, '');}return false;} catch (error) {console.error('Error evaluating text condition:', error);return false;}}
      if (typeof operatorOrCallback === 'function') {const callbackFn = operatorOrCallback;const checkInterval = 1000;const intervalId = setInterval(() => {try {const elem = bp(selector);if (isElementVisible(elem)) {clearInterval(intervalId);callbackFn();}} catch (error) {console.error('Error checking visibility:', error);}}, checkInterval);}
      else if (typeof operatorOrCallback === 'string' && (operatorOrCallback === '&&' || operatorOrCallback === '||')) {const operator = operatorOrCallback;const checkInterval = 1000;const intervalId = setInterval(() => {try {const elem = bp(selector);const isVisible = isElementVisible(elem);const isTextConditionMet = checkTextCondition(textCondition);
      if ((operator === '&&' && isVisible && isTextConditionMet) || (operator === '||' && (isVisible || isTextConditionMet))) {clearInterval(intervalId);callback();}} catch (error) {console.error('Error checking visibility and text condition:', error);}}, checkInterval);} else {console.error('Parameter tidak valid');}}
  function notify(txt, clicktocopy = false, clicktoclose = false, duration = cfg.get('SetDelay')) {const m = document.createElement('div');m.style.padding = '10px 20px';m.style.zIndex = 10000;m.style.position = 'fixed';m.style.width = `970px`;m.style.top = '10px';m.style.transform = 'translateX(-50%)';
    m.style.left = '50%';m.style.fontFamily = 'Arial, sans-serif';m.style.fontSize = '16px';m.style.color = 'white';m.style.textAlign = 'center';m.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';m.style.boxSizing = 'border-box';m.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.5)';m.style.cursor = 'pointer';
    const mainText = document.createElement('div');mainText.innerText = txt.replace('@', duration);m.appendChild(mainText);const actionText = document.createElement('span');actionText.style.position = 'absolute';actionText.style.right = '10px';actionText.style.bottom = '5px';actionText.style.fontSize = '12px';actionText.style.color = 'white';actionText.style.userSelect = 'none';
    if (clicktocopy) {actionText.innerText = 'Click to Copy';} else if (clicktoclose) {actionText.innerText = 'Click to Close';}m.appendChild(actionText);document.body.appendChild(m);m.addEventListener('click', () => {if (clicktocopy) {navigator.clipboard.writeText(txt.replace('@', duration)).then(() => {mainText.innerText = 'Copied to clipboard!';
    setTimeout(() => {document.body.removeChild(m);clearInterval(timerId);}, 1000);}).catch(err => {console.error('Failed to copy text: ', err);});}if (clicktoclose) {document.body.removeChild(m);clearInterval(timerId);}});const timerId = setInterval(() => {duration -= 1;if (duration <= 0) {clearInterval(timerId);} else {mainText.innerText = txt.replace('@', duration);}}, 1000);}
  function DoIfExists(query, actionOrTime = 'click', timeInSecOrFuncName = 1, funcName = 'setTimeout') {let action = 'click';let time = 1;let timerFuncName = 'setTimeout';if (typeof actionOrTime === 'number') {time = actionOrTime;timerFuncName = typeof timeInSecOrFuncName === 'string' ? timeInSecOrFuncName : 'setTimeout';} else if (typeof actionOrTime === 'string') {action = actionOrTime;time = typeof timeInSecOrFuncName === 'number' ? timeInSecOrFuncName : 1;timerFuncName = typeof funcName === 'string' ? funcName : 'setTimeout';}
    function GetForm(FormName) {const forms = document.forms;for (let i = 0; i < forms.length; i++) {if (FormName === 'mdn') {const form = forms[i].innerHTML;if (form.includes('Step')) {return forms[i];}} else if (FormName === 'Allin1') {const bait = forms[i].action;if (/bypass.html|adblock.html/.test(bait)) continue;return forms[i];}}return null;}
    let element;if (query === 'mdn' || query === 'Allin1') {element = GetForm(query);} else {element = bp(query);}if (element) {if (typeof element[action] === 'function') {if (timerFuncName === 'setTimeout' || timerFuncName === 'setInterval') {const timerFunc = window[timerFuncName];if (timerFuncName === 'setTimeout') {timerFunc(() => {
    try {element[action]();console.log(`Aksi "${action}" berhasil dijalankan pada elemen "${query}".`);} catch (error) {console.error(`Aksi "${action}" Gagal pada elemen "${query}":`, error);}}, time * 1000);} else if (timerFuncName === 'setInterval') {const intervalId = timerFunc(() => {try {if (elementExists(query)) {const currentElement = bp(query);currentElement[action]();console.log(`Aksi "${action}" berhasil dijalankan pada elemen "${query}".`);} else {console.error(`Elemen "${query}" tidak ditemukan.`);
    clearInterval(intervalId);}} catch (error) {console.error(`Aksi "${action}" Gagal pada elemen "${query}":`, error);clearInterval(intervalId);}}, time * 1000);console.log(`Interval ID: ${intervalId}`);}} else {console.error(`Timer tidak valid. Gunakan "setTimeout" atau "setInterval".`);}} else {console.error(`Elemen "${query}" tidak memiliki metode "${action}".`);}} else {console.error(`Elemen "${query}" tidak ditemukan.`);}}

  BypassedByBloggerPemula('gocmod.com', 'urls', '');
  BlockRead('(4d-bl0ck3r|ad-blocker)', 'setTimeout');
  //BypassedByBloggerPemula('api.gplinks.com', 'url', '');
  BypassedByBloggerPemula('writedroid.in', 'token', '');
  BypassedByBloggerPemula('web1s.com', 'token,url', '');
  BypassedByBloggerPemula('modmania.eu.org', 'token', '');
  BypassedByBloggerPemula(/linkpay.top/, () => {window.focus = true;});
  BypassedByBloggerPemula('diglies.com', 'id', 'https://linkpays.in/');
  BypassedByBloggerPemula('vbnmx.online', 'id', 'https://linkpays.in/');
  BypassedByBloggerPemula('ruwet.us', 'link', 'https://yo.adlinku.com/');
  BypassedByBloggerPemula('autodime.com', 'go', 'https://go.linkrex.net/');
  BypassedByBloggerPemula('fitnesswifi.com', 'id', 'https://tryshort.in/');
  BlockRead('(/adblock|/ad-now.php|/bypass|/detected.html)', 'setInterval');
  BypassedByBloggerPemula('marketrook.com', 'see', 'https://arolinks.com/');
  BypassedByBloggerPemula('ahtio.com', 'link', 'https://avashortener.com/');
  BypassedByBloggerPemula('switchhindi.com', 'link', 'https://udlinks.com/');
  BypassedByBloggerPemula('olhonagrana.com', 'link', 'https://syflink.com/');
  BypassedByBloggerPemula('veganab.co', 'link', 'https://techy.veganab.co/');
  BypassedByBloggerPemula('1apple.xyz', 'link', 'https://link.turkdown.com/');
  BypassedByBloggerPemula('akcartoons.in', 'link', 'https://go.moonlinks.in/');
  BypassedByBloggerPemula('blogsward.com', 'adlinkfly', 'https://linkpay.top/');
  BypassedByBloggerPemula('nisnisin.com', 'link', 'https://link.ezlinkad.com/');
  BypassedByBloggerPemula('poco.rcccn.in', 'id', 'https://links.rcccn.in/?id=');
  BypassedByBloggerPemula('links.rcccn.in', 'id', 'https://blog.techweedy.top/');
  BypassedByBloggerPemula('candleoflife.fun', 'token', 'https://shortsurl.pro/');
  BypassedByBloggerPemula('suntechu.in', 'post', 'https://web.urllinkshort.in/');
  BypassedByBloggerPemula('market.finclub.in', 'link', 'https://go.tnshort.net/');
  BypassedByBloggerPemula('link.sharedp.com', 'id', 'https://last.techyuth.xyz/');
  BypassedByBloggerPemula('poco.devnote.in', 'id', 'https://link.devnote.in/?id=');
  BypassedByBloggerPemula('(mewsr|techstudify).com', 'link', 'https://rplink.in/');
  BypassedByBloggerPemula('indirasari.com', 'link', 'https://link.paid4link.com/');
  BypassedByBloggerPemula('wikitraveltips.com', 'link', 'https://adrinolinks.in/');
  BypassedByBloggerPemula('encurtaclik.com', 'link', 'https://go.encurtaclik.com/');
  BypassedByBloggerPemula('appkamods.com', 'link', 'https://go.shorturllinks.com/');
  BypassedByBloggerPemula('keepzem.com', 'link', 'https://ahtio.com/safe.php?link=');
  //BypassedByBloggerPemula('venzoars.com', 'link', 'https://indids.com/token.php?id=');
  BypassedByBloggerPemula('short.sharedp.com', 'id', 'https://link.sharedp.com/?id=');
  BypassedByBloggerPemula('earn.tensailab.com', 'adlinkfly', 'https://go.snaply.in/');
  BypassedByBloggerPemula('postazap.com', 'link', 'https://encurtador.postazap.com/');
  BypassedByBloggerPemula('link.devnote.in', 'id', 'https://last.supermodsmenus.com/');
  BypassedByBloggerPemula('mamahawa.com', 'get', 'https://forextrader.site/SkipLink/');
  BypassedByBloggerPemula('shakib.quick91.com', 'link', 'https://link.get2short.com/');
  BypassedByBloggerPemula('reminimod.co', 'land', 'https://insurance.techymedies.com/');
  BypassedByBloggerPemula('indiamaja.com', 'link', 'https://newshuta.in/safe.php?link=');
  BypassedByBloggerPemula('tbhlabsnews.com', 'link', 'https://getlink.tbhlabsnews.com/');
  BypassedByBloggerPemula('interestingfactsare.com', 'link', 'https://m.urlbharat.xyz/');
  BypassedByBloggerPemula('djnonstopmusic.in', 'link', 'https://gadgets.ishortify.com/');
  BypassedByBloggerPemula('travelagancy.com', 'id', 'https://diglies.com/token.php?id=');
  BypassedByBloggerPemula('newshuta.in|60fpspubg.one', 'link', 'https://inshorturl.com/');
  BypassedByBloggerPemula('tech.filohappy.in', 'link', 'https://happyfiles.dtglinks.in/');
  BypassedByBloggerPemula('kelasadsense.com', 'adlinkfly', 'https://link.paid4link.com/');
  BypassedByBloggerPemula('trust.bgmi32bitapk.in', 'grey', 'https://get.instantearn.in/');
  //BypassedByBloggerPemula('stockinsights.in', 'post', 'https://diglies.com/token.php?id=');
  BypassedByBloggerPemula('news.topsarkariyojana.in', 'link', 'https://go.just2earn.com/');
  BypassedByBloggerPemula('(cyberlynews|quizrent).com', 'id', 'https://linkshortify.com/');
  BypassedByBloggerPemula('cafe.warrenrahul.in', 'adlinkfly', 'https://go.warrenrahul.in/');
  BypassedByBloggerPemula('earn.bankshiksha.in', 'LinkShortUrlID', 'https://go.kingurl.in/');
  BypassedByBloggerPemula('techurlshort.in', 'grey', 'https://hrpunjab.in/savise.php?grey=');
  BypassedByBloggerPemula('ninjamodz.litonmods.com', 'adlinkfly', 'https://shortxlinks.in/');
  BypassedByBloggerPemula('onlinerecruiters.in', 'link', 'https://diglies.com/token.php?id=');
  BypassedByBloggerPemula('earnmoneyyt.com', 'link', 'https://fitnesswifi.com/token.php?id=');
  BypassedByBloggerPemula('kingyojana.com', 'link', 'https://newkhabar24.com/safe.php?link=');
  BypassedByBloggerPemula('sayphotobooth.com', 'babu', 'https://odiadance.com/safe2.php?link=');
  BypassedByBloggerPemula('odiadance.com', 'link', 'https://shakib.quick91.com/safe2.php?link=');
  BypassedByBloggerPemula('rajdhanimaja.com', 'grey', 'https://techurlshort.in/inuser.php?grey=');
  BypassedByBloggerPemula('highkeyfinance.com', 'landhere', 'https://insurance.techymedies.com/');
  BypassedByBloggerPemula('financeyogi.net', 'link', 'https://market.finclub.in/safe2.php?link=');
  BypassedByBloggerPemula('finance.marketrook.com', 'woo', 'https://marketrook.com/verify.php?see=');
  BypassedByBloggerPemula('(gam3ah|m4cut|soft3arbi|elmokhbir|fatednews|itechmafiia).com', 'link', '');
  //BypassedByBloggerPemula('(surfsees|travelagancy).com', 'link', 'https://cryptings.in/token.php?id=');
  BypassedByBloggerPemula('newkhabar24.com', 'link', 'https://news.topsarkariyojana.in/safe.php?link=');
  BypassedByBloggerPemula(/mixrootmods.com/, function() {EnableRCF();window.checkStatus = window.off;});
  BypassedByBloggerPemula(/go.link4rev.site/, function() {location = location.href.replace('go.', '');});
  BypassedByBloggerPemula('(diglies|indids).com|cryptings.in', 'id', 'https://vbnmx.online/token.php?id=');
  BypassedByBloggerPemula(/infinityskull.com/, {'/safe.php': ['link', 'https://go.publicearn.com/'],}, false);
  BypassedByBloggerPemula(/link.linksfire.co/, function() {location = location.href.replace('link', 'blog');});
  BypassedByBloggerPemula('ninjamodz.mtcremix.com', 'adlinkfly', 'https://ninjamodz.litonmods.com/?adlinkfly=');
  BypassedByBloggerPemula('bharatbestdeals.com', 'post', 'https://a1.payalgaming.co.in/click.php?LinkShortUrlID=');
  BypassedByBloggerPemula('earn.thardekho.com|earn.dinoogaming.com', 'id', 'https://fitnesswifi.com/token.php?id=');
  BypassedByBloggerPemula('(examnewstoday|kaomojihub).com', 'see', 'https://finance.marketrook.com/verify.php?woo=');
  BypassedByBloggerPemula('earnbox.sattakingcharts.in', 'LinkShortUrlID', 'https://trust.bgmi32bitapk.in/geio.php?grey=');
  BypassedByBloggerPemula('a1.payalgaming.co.in', 'LinkShortUrlID', 'https://earn.bankshiksha.in/click.php?LinkShortUrlID=');
  BypassedByBloggerPemula(/dutchycorp.space/, function() {if (BpParams.has('code')) {location = BpParams.getAll('code') + '?verif=0';}});
  BypassedByBloggerPemula('(earnc1.bankshiksha|domain.bgmiupdate.com).in', 'grey', 'https://a1.payalgaming.co.in/click.php?LinkShortUrlID=');
  BypassedByBloggerPemula('(moderngyan|jbstudies|punjabworks).com|(payalgaming.co|star.bgmiupdate.com).in', 'grey', 'https://earnbox.sattakingcharts.in/click.php?LinkShortUrlID=');
  BypassedByBloggerPemula(/(teachsansar|technicalatg|foodxor).com/, () => waitForElm("#wpsafegenerate > #wpsafe-link > a[href]", safe => redirect(safe.href,false)));
  BypassedByBloggerPemula(/vk.com/, function() {if (BpParams.has('to') && location.href.includes('/away.php')) {location = decodeURIComponent(BpParams.get('to'));} else {}});
  BypassedByBloggerPemula(/paster.gg/, () => {if (BpParams.has('link') && location.href.includes('/dynamic-user')) {location = decodeURIComponent(BpParams.get('link'));} else {}});
  BypassedByBloggerPemula(/ouo.io/, function() {if (BpParams.has('s') && location.href.includes('link.nevcoins.club')) {location = 'https://' + BpParams.getAll('s');} else if (BpParams.has('s')) {location = BpParams.getAll('s');}});
  BypassedByBloggerPemula(/linkbox.to/, function() {Listener(function(object) {if (object.url.includes('api/file/detail?itemId')) {console.log(object.responseText);const {data: {itemInfo}} = JSON.parse(object.responseText);console.log(itemInfo); redirect(itemInfo.url, false);}});});
  BypassedByBloggerPemula(/adbtc.top/, () => {CaptchaDone(() => {DoIfExists("input[class^=btn]");});let count = 0; setInterval(function() {if (bp("div.col.s4> a") && !bp("div.col.s4> a").className.includes("hide")) {count = 0;
    bp("div.col.s4> a").click();} else {count = count + 1;}}, 5000); window.onbeforeunload = function() {if (unsafeWindow.myWindow) {unsafeWindow.myWindow.close();}
      if (unsafeWindow.coinwin) {let popc = unsafeWindow.coinwin; unsafeWindow.coinwin = {}; popc.close();}};});
  BypassedByBloggerPemula(/youtube.com/, function() {if (location.href.includes('/shorts/') && cfg.get('YTShort')) {if (cfg.get('YTShort') == true) {location = location.href.replace('/shorts/', '/watch?v=');let Tubeshort = location.href;
    var observer = new MutationObserver(() => {if (location.href !== Tubeshort) {Tubeshort = location.href; if (location.href.includes('/shorts/')) location = location.href.replace('/shorts/', '/watch?v=');}});
    var short = {subtree: true,childList: true}; observer.observe(document, short);}} else {}});
  Object.defineProperty(HTMLFormElement.prototype, 'submit', { writable: false });
  Object.defineProperty(document, 'querySelector', { value: document.querySelector, configurable: false, writable: false });
  const sl = (h => {
    switch (h.host) {case 'multiup.org': if (h.href.includes('/download/')) return h.href.replace('download/', 'en/mirror/'); break;
      case 'modsfire.com': if (/^\/([^\/]+)/.test(h.pathname)) {return 'https://modsfire.com/d/' + RegExp.$1;} break;
      //case 'pixeldrain.com': if (h.href.includes('/u/')) return h.href.replace('u/', '/api/file/') + '?download'; break;
      case 'www.google.com': if (h.pathname === '/url' && h.searchParams.has('q')) {return h.searchParams.get('q');} break;
      case 'social-unlock.com': if (/^\/([^\/]+)/.test(h.pathname)) {return 'https://social-unlock.com/redirect/' + RegExp.$1;} break;
      //case 'work.ink': if (/^\/([^\/]+)/.test(h.pathname)) {return 'https://adbypass.org/bypass?bypass=' + location.href.split('?')[0];} break;
      case 'uii.io': case 'shortano.link': case 'shortino.link': case 'clk.st': case 'chainfo.xyz': case 'clicksfly.com': case 'tryshort.in':
      case 'dailytime.store': case 'ez4short.com': case 'fc.lc': case 'cutp.in': case 'saly.io': case 'earnow.online': case 'gplinks.in':
      case 'linkfly.me': case 'linksfire.co': case 'adlink.click': case 'linkjust.com': case 'linkbulks.com': case 'traffic1s.com': case 'link4rev.site':
      case 'linkrex.net': case 'opli.xyz': case 'linksly.co': case 'ninjaurl.net': case 'shortyearn.com': case 'upshrink.com': case 'tr.link': case 'megaurl.in':
      case 'adshort.co': case 'atglinks.com': case 'shrinkforearn.in': case 'shorti.io': case 'try2link.com': case 'terafly.me': case 'www.wts.pw':
      case 'clk.sh': case 'web1s.com': case 'rocklinks.net': case 'megafly.in': case 'usalink.io': case 'adrinolinks.in': case '10short.com': case 'urlpay.in':
      case 'mdiskshortner.link': case 'cbshort.com': case 'droplink.co': case 'paid4link.com': case 'cuty.io': case 'doshrink.com':
      case 'revly.click': case 'shrinkearn.com': case 'shrinkme.io': case 'shortox.com': case 'linksfly.link': case 'oii.io':
      case 'ay.live': case 'urlstox.com': var ApiandUrl = h.searchParams.has('api') && h.searchParams.has('url');
        if (ApiandUrl && h.href.includes('hr.vikashmewada.com')) { return 'https://' + h.searchParams.getAll('url');
        } else if (ApiandUrl && h.href.includes('freeltc.top') || h.href.includes('freecrypto.top') || h.href.includes('insfly.pw') || h.href.includes('Insfly.pw') || h.href.includes('mdiskshortner.link') || h.href.includes('clockads.in') || h.href.includes('exashorts.fun') || h.href.includes('videolyrics.in')) {} else if (ApiandUrl && h.href.includes('terafly.me')) {
          return 'https://' + h.searchParams.getAll('url');
        } else if (ApiandUrl && h.href.includes('adnews.me')) {return h.searchParams.getAll('url').filter(u => /http(s|):\/\/adnews.me/.test(u))[0];
        } else if (ApiandUrl && h.href.includes('kyshort.xyz')) {return h.searchParams.getAll('url').filter(u => /http(s|):\/\/kyshort.xyz/.test(u))[0];
        } else if (ApiandUrl && h.href.includes('eazyurl.xyz')) {return h.searchParams.getAll('url').filter(u => /http(s|):\/\/eazyurl.xyz/.test(u))[0];
        } else if (ApiandUrl && h.href.includes('#')) {return h.searchParams.getAll('url') + window.location.hash;
        } else if (h.searchParams.has('api') && h.searchParams.has('url')) {return h.searchParams.getAll('url');} break; default: break;}})(new URL(location.href));if (sl) {location.href = sl;}
  // Injecting code from start and the end of document coded by @Konf
  if (cfg.get('BlockFC') == true) {NoFocus();} else {}
  if (cfg.get('RightFC') == true) {EnableRCF();} else {}
  if (['interactive', 'complete'].includes(document.readyState)) {onHtmlLoaded();} else {document.addEventListener('DOMContentLoaded', onHtmlLoaded);}
  function onHtmlLoaded() {
    let Numcode = bp('input.captcha_code');let DigitNum; function getLeft(d) {return parseInt(d.style.paddingLeft);} if (Numcode) {DigitNum = Numcode.parentElement.previousElementSibling.children[0].children; Numcode.value = [].slice.call(DigitNum).sort(function(d1, d2) {return getLeft(d1) - getLeft(d2);}).map(function(d) {return d.textContent;}).join('');}
    let List = ['lopteapi.com', '3link.co', 'web1s.com', 'vuotlink.vip'];let List1 = ['ay.live', 'gitlink.pro']; let $ = window.jQuery; let respect = ''; // Don't use My Scripts if You Change/Remove My Blogs, Except You Make Donations!!!.
    if (List.includes(location.host)) {DoIfExists('a.btn.btn-success.btn-lg.get-link', 3, 'setInterval');
    } else if (List1.includes(location.host)) { var form = $('form[id=go-link]');$.ajax({type: 'POST', async: true, url: form.attr('action'),data: form.serialize(),dataType: 'json',
        success: function(data) {redirect(data.url);}});} else if (elementExists('form[id=go-link]')) {}    const bas = (h => {const b = h.pathname === '/verify/' && /^\?([^&]+)/.test(h.search); const result = {isNotifyNeeded: false,redirectDelay: 0,link: undefined};
      switch (h.host) {
        case 'gamerfang.in': if (b) {meta('https://faux.gamerfang.in/tech/' + RegExp.$1);} break;
        case 'blog.mphealth.online': if (b) {meta('https://techyuth.xyz/blog/' + RegExp.$1);} break;
        case 'mphealth.online': if (b) {meta('https://blog.mphealth.online/verify/?' + RegExp.$1);} break;
        case 'shrs.link': case 'shareus.io':
          if (/^\/old\/([^\/]+)/.test(h.pathname)) {return 'https://jobform.in/?link=' + RegExp.$1;} break;
        case 'www.gifans.com':
          if (/^\/link\/([^\/]+)/.test(h.pathname)) {return 'https://shortlink.prz.pw/' + RegExp.$1;} break;
        case 'www.pythondunyasi.com':
          if (h.pathname === '/p/blog-page_22.html' && h.searchParams.has('url')) {return h.searchParams.get('url').substring(1);} break;
        case 'jrlinks.in':
          if (h.pathname === '/safe2.php' && h.searchParams.has('link')) {meta('https://internet.webhostingtips.club/' + h.searchParams.get('link'));} break;
        default: break;}})(new URL(location.href)); if (bas) {const {isNotifyNeeded, redirectDelay, link} = bas;
      if (isNotifyNeeded) {notify(``);}
      setTimeout(() => {location.href = link;}, redirectDelay * 1000);}
    // My Script will automatically download from the site below , Enable it from the Settings
    if (cfg.get('AutoDL') == true) {
    BypassedByBloggerPemula(/upload.ee/, function() {DoIfExists('#d_l', 2);});
    BypassedByBloggerPemula(/appdrive\.*/, function() {DoIfExists('#drc', 2);});
    BypassedByBloggerPemula(/dayuploads.com/, () => {DoIfExists('#ad-link2', 2);});
    BypassedByBloggerPemula(/dddrive.me/, () => {DoIfExists('.btn-outline-primary', 2);});
    BypassedByBloggerPemula(/uppit.com/, () => {DoIfExists('.btn-primary.btn-xl.btn', 2);});
    BypassedByBloggerPemula(/krakenfiles.com/, () => {DoIfExists('.download-now-text', 2);});
    BypassedByBloggerPemula(/file-upload.net/, () => {DoIfExists('#downbild.g-recaptcha', 2);});
    BypassedByBloggerPemula(/userscloud.com|dosya.co/, () => {DoIfExists('#btn_download', 2);});
    BypassedByBloggerPemula(/hexupload.net/, () => {DoIfExists('.btn-success.btn-lg.btn', 1);});
    BypassedByBloggerPemula(/gofile.io/, () => {waitForElm('a.me-1', gfBtn => gfBtn.click());});
    BypassedByBloggerPemula(/rapidgator.net/, () => {DoIfExists('.btn-free.act-link.link', 2);});
    BypassedByBloggerPemula(/dbree.me/, () => {DoIfExists('.center-block.btn-default.btn', 2);});
    BypassedByBloggerPemula(/dropgalaxy.com/, () => {DoIfExists("button[id^='method_fre']", 2);});
    BypassedByBloggerPemula(/megaupto.com/, () => {DoIfExists('#direct_link > a:nth-child(1)', 2);});
    BypassedByBloggerPemula(/karanpc.com/, () => {DoIfExists('#downloadButton > form', 'submit', 2);});
    BypassedByBloggerPemula(/douploads.net/, () => {DoIfExists('.btn-primary.btn-lg.btn-block.btn', 2);});
    BypassedByBloggerPemula(/dataupload.net/, async function() {await sleep(5000);ReadytoClick('.downloadbtn');});
    BypassedByBloggerPemula(/buzzheavier.com/, function() {waitForElm('#download-link', bhvBtn => bhvBtn.click());});
    BypassedByBloggerPemula(/filemoon.sx/, () => waitForElm('div.download2 a.button', fm => redirect(fm.href, false)));
    BypassedByBloggerPemula(/dailyuploads.net/, () => {CaptchaDone(() => {DoIfExists('#downloadbtn');});DoIfExists('#fbtn1', 2);});
    BypassedByBloggerPemula(/bestfonts.pro/, () => waitForElm('.download-font-button > a:nth-child(1)', pro => redirect(pro.href)));
    BypassedByBloggerPemula(/uploadev.org/, () => {CaptchaDone(() => {DoIfExists('#downloadbtn');});DoIfExists('#direct_link > a', 2);});
    BypassedByBloggerPemula(/files.fm/, () => waitForElm('#head_download__all-files > div > div > a:nth-child(1)', flBtn => flBtn.click()));
    BypassedByBloggerPemula(/megaup.net/, function() {waitForElm('a.btn.btn-default', muBtn => muBtn.click());DoIfExists('#btndownload', 7);});
    BypassedByBloggerPemula(/mega4upload.net/, () => {DoIfExists("input[name=mega_free]",2);CaptchaDone(() => {DoIfExists('#downloadbtn');});});
    BypassedByBloggerPemula(/financemonk.net/, () => {CaptchaDone(() => {DoIfExists('#downloadBtnClick');});DoIfExists('#dllink', 'submit', 3);});
    BypassedByBloggerPemula(/usersdrive.com|ddownload.com/, () => {CaptchaDone(() => {DoIfExists('#downloadbtn');});DoIfExists('.btn-download.btn', 1);});
    BypassedByBloggerPemula(/adoc.pub/, () => {DoIfExists('.btn-block.btn-success.btn', 2);CaptchaDone(() => {DoIfExists('.mt-15.btn-block.btn-success.btn-lg.btn');});});
    BypassedByBloggerPemula(/pdfcoffee.com/, () => {DoIfExists('.btn-block.btn-success.btn', 2);CaptchaDone(() => {DoIfExists('.my-2.btn-block.btn-primary.btn-lg.btn');});});
    BypassedByBloggerPemula(/uploady.io/, () => {CaptchaDone(() => {DoIfExists('#downloadbtn');});DoIfExists('#free_dwn', 2);DoIfExists('.rounded.btn-primary.btn', 2);});
    BypassedByBloggerPemula(/file-upload.org/, () => {DoIfExists("button[name='method_free']", 2);DoIfExists('.download-btn',2);CaptchaDone(() => {DoIfExists('#downloadbtn');});});
    BypassedByBloggerPemula(/up-load.io|downloadani.me/, () => {DoIfExists("input[name='method_free']", 2);DoIfExists('.btn-dow.btn', 1);CaptchaDone(() => {DoIfExists('#downloadbtn');});});
    BypassedByBloggerPemula(/up-4ever.net/, () => {DoIfExists("input[name='method_free']", 2);DoIfExists('#downLoadLinkButton', 5);CaptchaDone(() => {DoIfExists('#downloadbtn');});});
    BypassedByBloggerPemula(/mexa.sh/, () => {parent.open = BpBlock();DoIfExists('#Downloadfre', 2);DoIfExists('#direct_link', 2);CaptchaDone(() => {DoIfExists('#downloadbtn');});});
    BypassedByBloggerPemula(/hitfile.net/, () => {CaptchaDone(() => {DoIfExists('#submit');});DoIfExists('.nopay-btn.btn-grey',2);waitForElm('#popunder2', hfl2 => redirect(hfl2.href, false),37);});
    BypassedByBloggerPemula(/4fnet.org/, function() {if (location.href.includes('/goto')) {let fnet = location.href.split('/').slice(-1);redirect(atob(fnet),false);}});
    BypassedByBloggerPemula(/oxy\.*/, function() {if (elementExists('#divdownload')) {let oxy = bp('.ocdsf233').getAttribute('data-source_url');redirect(oxy, false);}});
    BypassedByBloggerPemula(/udrop.com/, () => waitForElm('.responsiveMobileMargin > button:nth-child(1)', udr => redirect(strBetween(udr.onclick.toString(), `openUrl('`, `')`), false)));
    BypassedByBloggerPemula(/mp4upload.com/, function() {
      DoIfExists('#todl', 2);DoIfExists("form[name='F1']", 'submit', 1);});
    BypassedByBloggerPemula(/drop.download/, function() {
      DoIfExists('#method_free', 2);DoIfExists('.btn-download', 2);});
    BypassedByBloggerPemula(/workupload.com/, function() {
      if (elementExists('#download')) {DoIfExists('.btn-prio.btn', 2);}});
    BypassedByBloggerPemula(/hxfile.co|ex-load.com|megadb.net/, function() {
      DoIfExists('.btn-dow.btn', 2);DoIfExists("form[name='F1']", 'submit', 1);});
    BypassedByBloggerPemula(/send.cm/, function() {
      if (elementExists('#fileinfo')) {DoIfExists('#downloadbtn', 1);} else {}});
    BypassedByBloggerPemula(/mega4up.org/, function() {
      DoIfExists('input.btn.btn-info.btn-sm', 2);DoIfExists('.btn-dark.btn', 2);});
    BypassedByBloggerPemula(/docs.google.com/, function() {
      if (elementExists('#uc-dl-icon')) {DoIfExists('#downloadForm', 'submit', 1);} else {}});
    BypassedByBloggerPemula(/uploadhaven.com/, function() {
      DoIfExists('.alert > a:nth-child(1)', 2);DoIfExists('#form-download', 'submit', 1);});
    BypassedByBloggerPemula(/k2s.cc/, function() {DoIfExists('.button-download-slow', 2);
      waitForElm('a.link-to-file', k2s => redirect(k2s.href, false));});
    BypassedByBloggerPemula(/ac.totsugeki.com/, function() {
      $("a[target='_blank']").removeAttr("target");DoIfExists('.btn-lg.btn-success.btn', 2);});
    BypassedByBloggerPemula(/anonym.ninja/, function() {
      if (location.href.includes('download/')) {var fd = window.location.href.split('/').slice(-1)[0];
      redirect(`https://anonym.ninja/download/file/request/${fd}`);} else {}});
    BypassedByBloggerPemula(/vosan.co/, function() {bp('.elementor-size-lg').removeAttribute('target');
      DoIfExists('.elementor-size-lg', 2);DoIfExists('.wpdm-download-link', 2);});
    BypassedByBloggerPemula(/apkmody.io/, function() {
      if (elementExists('div.wp-block-buttons > div')) {location = location.href + '/download/mod';}});
    BypassedByBloggerPemula(/mdfx9dc8n.net/, () => {DoIfExists('.download-btn', 2);
      setTimeout(() => {let md = bp('.download-btn.btn3.btn');redirect(md.href, false);}, 6 * 1000);});
    BypassedByBloggerPemula(/takefile.link/, function() {
      if (elementExists('#F1')) {DoIfExists('div.no-gutter:nth-child(2) > form:nth-child(1)', 'submit', 1);} else {}});
    BypassedByBloggerPemula(/appsblaze.com/, function() {
      if (elementExists('#box-0')) {waitForElm("input[name='slink']", abl => redirect(abl.href, false));} else {}});
    BypassedByBloggerPemula(/modcombo.com/, function() {
      if (location.href.includes('download/')) {waitForElm('div.item.item-apk a', mc => redirect(mc.href, false));
        DoIfExists('a.btn.btn-submit', 6);} else {DoIfExists('a.btn.btn-red.btn-icon.btn-download.br-50', 2);}});
    BypassedByBloggerPemula(/1fichier.com/, function() {
      if (elementExists('#pass')) {} else {DoIfExists('.btn-orange.btn-general.ok', 1);DoIfExists('.alc', 'submit', 1);}});
    BypassedByBloggerPemula(/fileresources.net/, function() {
      if (elementExists('.download-timer')) {waitForElm('a.btn.btn-default', fpr => redirect(fpr.href, false));} else {}});
    BypassedByBloggerPemula(/freepreset.net/, function() {
      if (elementExists('#button_download')) {waitForElm('a#button_download', fpr => redirect(fpr.href, false));} else {}});
    BypassedByBloggerPemula(/doodrive.com/, function() {DoIfExists('.tm-button-download.uk-button-primary.uk-button', 3);
      waitForElm('.uk-container > div > .uk-button-primary.uk-button', ddr => redirect(ddr.href, false));});
    BypassedByBloggerPemula(/gocmod.com/, function() {
      if (elementExists('.view-app')) {bp('#no-link').removeAttribute('target');DoIfExists('.download-line-title', 2);}});
    BypassedByBloggerPemula(/(uploadrar|fingau|getpczone|wokaz).com|uptomega.me/, function() {DoIfExists('.mngez-free-download', 2);
      DoIfExists('#direct_link > a:nth-child(1)', 2);$('#downloadbtn').click();});
    BypassedByBloggerPemula(/mediafire.com/, function() {var bass;var md = function closeWindows() {window.close();clearInterval(bass);};
      var mf = bp('.download_link .input').getAttribute('href');console.log(mf);location.replace(mf);bass = setInterval(md, 1000 * 5);});
    BypassedByBloggerPemula(/qiwi.gg/, function() {if (elementExists("div [class^='page_DownloadPage']")) {
      DoIfExists("button[class^='DownloadButton_ButtonSoScraperCanTakeThisName']", 2);
        let qiwi = bp("a[class^='DownloadButton_DownloadButton']"); setTimeout(() => {redirect(qiwi.href, false);}, 3 * 1000);} else {}});
    BypassedByBloggerPemula(/turbobit.net/, () => {if (elementExists('#turbo-table')) {let tb = bp('#nopay-btn').href;redirect(tb, false);}
      CaptchaDone(() => {DoIfExists('#submit');});waitForElm('#free-download-file-link', tur => redirect(tur.href, false));});
    BypassedByBloggerPemula(/sharemods.com/, function() {DoIfExists('#dForm', 'submit', 2);
      if (elementExists('.download-file-holder')) {waitForElm('a#downloadbtn.btn.btn-primary', smd => redirect(smd.href, false));} else {}});
    BypassedByBloggerPemula(/(kusonime|oploverz).org|(opinimedia|beritaotaku|caramasak).com|otakudesu.cc|resepkoki.net|neonime\.*/, function() {
      waitForElm('.bg-gb.dwto.sdw', kmBtn => kmBtn.click());waitForElm('a.sdw.dwto.bg-gb', kmk => redirect(kmk.href, false));});
    BypassedByBloggerPemula(/clickndownload.org|clicknupload\.*/, function() {if (elementExists('.download')) {DoIfExists('span.downloadbtn', 10);
      DoIfExists('#method_free', 2);waitForElm('a.downloadbtn', cnu => redirect(cnu.href, false));}});
    BypassedByBloggerPemula(/leechpub.com/, function() {
      if (elementExists('.text-center.py-6')) {waitForElm('a.btn.btn-lg.btn-success.mb-1.px-6.lh-10', lpub => redirect(lpub.href, false));} else {}});
    BypassedByBloggerPemula(/rawlazy.si/, function() {
      if (elementExists('#captcha_form')) {DoIfExists('.go-to-captcha-form', 2);} else {waitForElm('.color-btn', rlz => redirect(rlz.href, false));}});
    BypassedByBloggerPemula(/downloader.tips/, () => {CaptchaDone(() => {DoIfExists('button.btn.btn-primary');});
      let downloader = setInterval(() => {if (bp('#count').innerText == '0') {clearInterval(downloader);DoIfExists('.btn-primary.btn');}}, 1 * 1000);});
    BypassedByBloggerPemula(/modsbase.com/, function() {
      if (elementExists('.file-panel')) {DoIfExists('.download-file-btn', 2);waitForElm('#downloadbtn > a', mba => redirect(mba.href, false));} else {}});
    BypassedByBloggerPemula(/(thecubexguide|miuiflash).com|(djxmaza|jytechs).in/, function() {if (elementExists('.premium')) {
        ReadytoClick('a#dlbtn.btn.btn-secondary.btn-block.mb-4', 2);DoIfExists('#downloadbtnf', 3);DoIfExists('#downloadbtn', 4, 'setInterval');} else {}});
    BypassedByBloggerPemula(/filedm.com/, function() {
      if (elementExists('#dlbutton')) {waitForElm('#dlbutton', fdm => redirect('http://cdn.directfiledl.com/getfile?id=' + fdm.href.split('_')[1], false));} else {}});
    BypassedByBloggerPemula(/drive.google.com/, function() {var dg = window.location.href.split('/').slice(-2)[0];
      if (window.location.href.includes('drive.google.com/file/d/')) {redirect(`https://drive.usercontent.google.com/download?id=${dg}&export=download`, false).replace('<br />', '');
      } else if (window.location.href.includes('drive.google.com/u/0/uc?id')) {DoIfExists('#download-form', 'submit', 1);} else {}});
    BypassedByBloggerPemula(/4shared.com/, function() {if (elementExists('.d3topTitle')) {
        $('.premium').text('IMPORTANT TRICKS By BloggerPemula : Updated Feb 2023, Look like now not working ,so Sorry at This Time i Dont have Idea to fix it . Regards...');}
      DoIfExists('.jsDownloadButton', 2);if (elementExists('.freeDownloadButton')) {DoIfExists("form[name^='redirectToD3Form']", 'submit', 3);}});
    } else {} // Does Nothing if You Not Tick Auto Download From Menu Settings
    // End of Auto Download , Leave Good Feedback if Your Favorite Sites Not yet Supported or Error on Downloading Process

    BypassedByBloggerPemula(/megaurl.win/, () => {DoIfExists('#generate_link', 2);});
    BypassedByBloggerPemula(/keeplinks.org/, function() {DoIfExists('#btnchange', 2);});
    BypassedByBloggerPemula(/earnlink.io/, function() {DoIfExists('.btn-secondary', 3);});
    BypassedByBloggerPemula(/mkomsel.com/, function() {DoIfExists('#downloadfile', 12);});
    BypassedByBloggerPemula(/onimports.com.br/, function() {DoIfExists('#finalLink', 2);});
    BypassedByBloggerPemula(/1shortlink.com/, function() {DoIfExists('#redirect-link', 3);});
    BypassedByBloggerPemula(/1ink.cc|cuturl.cc/, function() {DoIfExists('#countingbtn', 1);});
    BypassedByBloggerPemula(/jameeltips.us/, function() {DoIfExists('#continue_button_1', 1);});
    BypassedByBloggerPemula(/post.copydev.com/, function() {DoIfExists('.btn-success.btn', 6);});
    BypassedByBloggerPemula(/1short.io/, function() {DoIfExists('#countDownForm', 'submit', 7);});
    //BypassedByBloggerPemula(/linegee.net/, function() {DoIfExists('.btn-xs.btn-primary.btn', 2);});
    BypassedByBloggerPemula(/bedrat.xyz|uhtrdr47.online/, function() {DoIfExists('#link1112', 5);});
    BypassedByBloggerPemula(/pro.sh/, function() {DoIfExists('.btn-secondary', 3, 'setInterval');});
    BypassedByBloggerPemula(/playpaste.com/, () => {CaptchaDone(() => {DoIfExists('button.btn');});});
    BypassedByBloggerPemula(/proappapk.com|meclipstudy.in/, function() {DoIfExists('#gotolink', 5);});
    BypassedByBloggerPemula(/1bitspace.com/, function() {DoIfExists('.button-element-verification',3);});
    BypassedByBloggerPemula(/cshort.org/, function() {DoIfExists('.timer.redirect', 3, 'setInterval');});
    BypassedByBloggerPemula(/render-state.to/, function() {if (BpParams.has('link')) {window.goToLink();}});
    BypassedByBloggerPemula(/offerwall.me|ewall.biz/, () => {CaptchaDone(() => {DoIfExists('#submitBtn');});});
    BypassedByBloggerPemula(/linkpay.cc/, () => {parent.open = BpBlock(); DoIfExists('#link-view', 'submit', 1);});
    BypassedByBloggerPemula(/cooklike.info|model-tas-terbaru.com/, {'/': ['link', 'https://yousm.link/'],}, false);
    BypassedByBloggerPemula(/kisalt.digital/, function() {if (BpParams.has('u')) {meta(atob(BpParams.get('u')));}});
    BypassedByBloggerPemula(/bildirim.in|bildirim.eu|bildirim.link/, function() {DoIfExists('#btnPermission', 1);});
    BypassedByBloggerPemula(/enlacito.com/, () => {setTimeout(() => {redirect(window.DYykkzwP,false);}, 2 * 1000);});
    BypassedByBloggerPemula(/firefaucet.win/, function() {CaptchaDone(() => {DoIfExists('button[type=submit]',1);});});
    BypassedByBloggerPemula(/aryx.xyz/, () => {DoIfExists('.container > div:nth-child(4) > button:nth-child(1)', 3);});
    BypassedByBloggerPemula(/webhostingtips.club/, {'/safe.php': ['link', 'https://jrlinks.in/safe2.php?link='],}, false);
    BypassedByBloggerPemula(/uptobhai\.*|uplinkto\.*|shortlinkto\.*/, () => {DoIfExists('.btn-block.btn-primary.btn', 2);});
    BypassedByBloggerPemula(/michaelemad.com|7misr4day.com/, () => waitForElm('a.s-btn-f', mld => redirect(mld.href, false)));
    BypassedByBloggerPemula(/shareus.io/, function() {if (BpParams.has('sid')) {ReadytoClick('button.MuiButtonBase-root', 2);}});
    BypassedByBloggerPemula(/adtival.network/, function() {if (BpParams.has('shortid')) {meta(atob(BpParams.get('shortid')));}});
    BypassedByBloggerPemula(/tii.la|oei.la|iir.la|tvi.la|oii.la|tpi.li|lnbz.la/, () => {CaptchaDone(() => {DoIfExists('#continue');});});
    BypassedByBloggerPemula(/(bnbfree|freeth|freebitco).in/, () => {CaptchaDone(() => {DoIfExists('#free_play_form_button');});});
    BypassedByBloggerPemula(/cutnet.net|(exego|cety).app|(jixo|jizo|gamco).online|cutyion.com/, () => {DoIfExists('#submit-button', 5, 'setInterval');});
    BypassedByBloggerPemula(/khaddavi.net|contentmenarik.com/, () => {parent.open = BpBlock();CaptchaDone(() => {DoIfExists('#slu-btn');});});
    BypassedByBloggerPemula(/gobits.me|zcash.one|clickscoin.com|beycoin.xyz|bitsusdt.com|adsluffa.online/, function() {DoIfExists('#mdt', 3);});
    BypassedByBloggerPemula(/travelinian.com/, () => {DoIfExists('#rtgli1', 2);DoIfExists('#rtg-snp2', 3);DoIfExists('#open-continue-btn', 4);});
    BypassedByBloggerPemula(/sharetext.me/, function() {if (location.href.includes('/redirect') && BpParams.has('url')) {meta(atob(BpParams.get('url')));}});
    BypassedByBloggerPemula(/sfl.gl|moneyblink.com/, function() {if (location.href.includes('/ready') && BpParams.has('u')) {meta(atob(BpParams.get('u')));}});
    BypassedByBloggerPemula(/(fourlinez|newsonnline|phonesparrow|creditcarred).com|(alljntuworld|updatewallah).in/, () => {ReadytoClick('#continue-show', 12);});
    BypassedByBloggerPemula(/comohoy.com/, function() {if (location.href.includes('/grab/out.html') && BpParams.has('url')) {meta(atob(BpParams.get('url')));}});
    BypassedByBloggerPemula(/linkforearn.click/, () => waitForElm('#shortLinkSection.short-link-section a.btn', linkforearn => redirect(linkforearn.href, false)));
    BypassedByBloggerPemula(/apkw.ru/, function() {if (location.href.includes('/away')) {let apkw = location.href.split('/').slice(-1);redirect(atob(apkw),false);}});
    BypassedByBloggerPemula(/(newsbawa|utkarshonlinetest|techbezzie|financewada).com/, function() {DoIfExists('#citr-click', 2);DoIfExists('#citr-click-f', 3);DoIfExists('#GetLink', 4);});
    BypassedByBloggerPemula(/programasvirtualespc.net/, function() {if (location.href.includes('out/')) {const pvc = location.href.split('?')[1]; redirect(atob(pvc),false);} else {}});
    BypassedByBloggerPemula(/(blackleadr|shortcuthigh|newztalkies|cybertyrant).com|hubdrive.me|fileroot.net|nzarticles.pro/, function() {if (BpParams.has('r')) {meta(atob(BpParams.get('r')));}});
    BypassedByBloggerPemula(/(10short|lollty).pro|mamahawa.com/, function() {ReadytoClick('center > .btn-success.btn', 3);waitForElm('a#makingdifferenttimer', st1 => redirect(st1.href, false));waitForElm('a#proceed', st2 => redirect(st2.href, false));});
    BypassedByBloggerPemula(/(aduzz|tutorialsaya|indobo|baristakesehatan|merekrut).com|deltabtc.xyz|bit4me.info/, () => {waitForElm("div[id^=wpsafe] > a[rel=nofollow]", tiny => redirect(strBetween(tiny.onclick.toString(), `window.open('`, `', '_self')`), false));});
    BypassedByBloggerPemula(/cryptfaucet.com|izseo.net/, function() {window.checkTimeRemaining = true;let cryptf = bp("div[id^=wpsafe] > a[rel=nofollow]");setTimeout(() => {redirect(strBetween(cryptf.onclick.toString(), `window.open('`, `', '_self')`), false);}, 5 * 1000);});
    BypassedByBloggerPemula(/(cryptosparatodos|placementsmela|howtoconcepts|tuasy|skyrimer|foodxor|yodharealty|mobcupring).com|(paidinsurance|sevayojana).in|zaku.pro/, () => waitForElm('#wpsafe-link a', bti => redirect(strBetween(bti.onclick.toString(), `window.open('`, `', '_self')`), false)));
    BypassedByBloggerPemula(/fansonlinehub.com/, async function() {setInterval(() => {window.scrollBy(0, 1);window.scrollTo(0,-1);ReadytoClick('.active.btn > span');}, 3 * 1000);});
    BypassedByBloggerPemula(/(howifx|vocalley|financerites|yogablogfit|healthfirstweb|junkyponk|mythvista|blog-myst|webhostsec).com|ss7.info|sololevelingmanga.pics/, () => {DoIfExists('#getlink', 3);});
    BypassedByBloggerPemula(/(viralxns|uploadsoon).com/, function(){DoIfExists('#tp-snp2.tp-blue.tp-btn', 2);DoIfExists('.tp-white.tp-btn', 3);});
    BypassedByBloggerPemula(/setroom.biz.id/, () => {CheckVisibility('#txt3', () => {window.rtglink();DoIfExists('#button3 .rtg-button', 1);});});
    BypassedByBloggerPemula(/ouo.io|ouo.press/, async function() {await sleep(4000);ReadytoClick('button#btn-main.btn.btn-main');});
    BypassedByBloggerPemula(/largestpanel.in|earnme.club|usanewstoday.club/, function() {DoIfExists('#tp-snp2', 1);});
    BypassedByBloggerPemula(/lksfy.com/, () => {CaptchaDone(() => {DoIfExists('.get-link.btn-primary.btn');});});
    BypassedByBloggerPemula(/paste1s.com|note1s.com/, function() {DoIfExists('.btn-lg.btn-primary.btn', 2);});
    BypassedByBloggerPemula(/terabox.fun/, async function() {await sleep(3000);ReadytoClick('.active.btn');});
    BypassedByBloggerPemula(/karyawan.co.id/, function() {
      DoIfExists('button#btn.bg-blue-100.text-blue-600', 3);});
    BypassedByBloggerPemula(/icerik.site/, function() {
      DoIfExists('#csubmit', 2);DoIfExists('#get_link_btn', 2);});
    BypassedByBloggerPemula(/ponselharian.com/, function() {
      if (elementExists('#link-view')) {window.scrollTo(0, 9999);}});
    BypassedByBloggerPemula(/assettoworld.com/, function() {
      DoIfExists('.text-capitalize.btn-outline-success.btn', 3);});
    BypassedByBloggerPemula(/adfoc.us/, function() {
      if (elementExists('#skip')) {let adf = bp('.skip').href; redirect(adf);}});
    BypassedByBloggerPemula(/yoshare.net|olhonagrana.com/, function() {
      DoIfExists('#yuidea', 'submit', 2);DoIfExists('#btn6', 2);});
    BypassedByBloggerPemula(/oii.io/, function() {parent.open = BpBlock();
      DoIfExists('button.g-recaptcha.btn.btn-primary', 2);});
    BypassedByBloggerPemula(/mrproblogger.com|themezon.net/, function() {
      waitForElm('#btn2.tp-btn', mrBp => mrBp.click());
      waitForElm('div.center-link-items a', thz => redirect(thz.href, false));});
    BypassedByBloggerPemula(/forex-golds.com|forex-trnd.com/, function() {
      parent.open = BpBlock();DoIfExists('.g-recaptcha', 2);});
    BypassedByBloggerPemula(/1link.club/, function() {
      $("a[target='_blank']").removeAttr("target");DoIfExists('#download', 1);});
    BypassedByBloggerPemula(/slink.bid/, function() {
      DoIfExists('#btn-generate', 1);
      DoIfExists('.btn-success.btn', 5);});
    BypassedByBloggerPemula(/blog.yurasu.xyz/, function() {
      DoIfExists('#wcGetLink', 2);DoIfExists('#gotolink', 3);});
    BypassedByBloggerPemula(/zegtrends.com/, function() {DoIfExists('#cln', 'submit', 5);
      DoIfExists('#bt1', 5);DoIfExists('#go', 5);});
    BypassedByBloggerPemula(/coincroco.com|surflink.tech/, function() {
      waitForElm('.mb-sm-0.mt-3.btnBgRed', ccBtn => ccBtn.click());});
    BypassedByBloggerPemula(/solidcoins.net|fishingbreeze.com/, () => {
      CaptchaDone(() => {DoIfExists('form[action]', 'submit');});
      if (!elementExists('.g-recaptcha')) {DoIfExists('mdn', 'submit', 17);}});
    BypassedByBloggerPemula(/bigbtc.win/, () => {CaptchaDone(() => {DoIfExists('#claimbutn');});
      if (location.href.includes('/bonus')) {DoIfExists('#clickhere', 2);}});
    BypassedByBloggerPemula(/linkspy.cc/, function() {
      if (elementExists('.skipButton')) {let lsp = bp('.skipButton').href;redirect(lsp, false);}});
    BypassedByBloggerPemula(/(superheromaniac|spatsify|mastkhabre|ukrupdate).com/, () => {
      DoIfExists('#tp98', 10);DoIfExists('#btn6', 12);DoIfExists("form[name='tp']", 'submit', 11);});
    BypassedByBloggerPemula(/4hi.in|shortie.sbs|10short.com|finish.wlink.us/, () => {
      DoIfExists('#form-continue', 'submit', 2);CaptchaDone(() => {DoIfExists('#invisibleCaptchaShortlink');});});
    BypassedByBloggerPemula(/chainfo.xyz/, () => {
      if (location.href.includes('/next/')) {redirect('https://www.google.com/url?q=https://setroom.biz.id');}});
    BypassedByBloggerPemula(/100puan.com/, function() {
      DoIfExists('.big-text', 3);waitForElm('div.bb-sticky-el a', pbz => redirect(pbz.href, false));});
    BypassedByBloggerPemula(/sub2get.com/, function() {
      if (elementExists('#butunlock')) {let subt = bp('#butunlock > a:nth-child(1)').href;redirect(subt);}});
    BypassedByBloggerPemula(/(fc-lc|loaninsurehub).com|fc-lc.xyz/, function() {DoIfExists('#invisibleCaptchaShortlink', 3);
      DoIfExists('#getlink', 3);DoIfExists('#glink', 4);DoIfExists('#surl', 5);});
    BypassedByBloggerPemula(/go.shareus.in/, function() {
      if (BpParams.has('shortid') && BpParams.has('link')) {meta(atob(BpParams.get('link')));}});
    BypassedByBloggerPemula(/infonerd.org|coingraph.us/, () => {EnableRCF();
      CheckVisibility('#redirectButton', '||', "bp('#countdown').innerText == '0'", () => {window.redirectToUrl();});});
    BypassedByBloggerPemula(/leitup.com/, function() {
      if (elementExists('#button_timer')) {waitForElm('input.form-control', leit => redirect(leit.placeholder, false));}});
    BypassedByBloggerPemula(/(blogmado|kredilerim|insuranceleadsinfo).com/, () => {
      CaptchaDone(() => {DoIfExists('button.btn');});waitForElm('a.get-link.disabled a', cho => redirect(cho.href, false));});
    BypassedByBloggerPemula(/azmath.info|expertvn.com/, () => {if (elementExists('#megaurl-verified-captcha')) {
      DoIfExists('button.h-captcha', 3);} else {DoIfExists('#megaurl-banner-page', 'submit', 2);}});
    BypassedByBloggerPemula(/coinsrev.com/, () => {parent.open = BpBlock();CaptchaDone(() => {DoIfExists('#wpsafelinkhuman > input');});
      DoIfExists('#wpsafe-generate > a > img', 3);DoIfExists('input#image3', 13);});
    BypassedByBloggerPemula(/www.google.com|recaptcha.net/, async function() {await sleep(3000) && cfg.get('reCAPTCHA') && cfg.get('ApiKey');
      if (!APIKEY && cfg.get('reCAPTCHA') == true) {ReadytoClick('.recaptcha-checkbox-border');} else {}});
    BypassedByBloggerPemula(/newassets.hcaptcha.com/, async function() {await sleep(3000) && cfg.get('hCaptcha') && cfg.get('ApiKey');
      if (!APIKEY && cfg.get('hCaptcha') == true) {ReadytoClick('#checkbox');} else {}});
    BypassedByBloggerPemula(/(ez4mods|tensailab|game5s|supermodsmenus).com|tech5s.co/, function() {DoIfExists('div.text-center form', 'submit', 2);ReadytoClick('#go_d', 1);
      waitForElm('a#go_d.submitBtn.btn.btn-primary', ez => redirect(ez.href, false));
      waitForElm('a#go_d2.submitBtn.btn.btn-primary', ez2 => redirect(ez2.href, false));});
    BypassedByBloggerPemula(/mazen-ve3.com/, function() {EnableRCF();let maze = setInterval(() => {
        if (bp('.filler').innerText == 'Wait 0 s') {clearInterval(maze);ReadytoClick('#btn6');ReadytoClick('.btn-success.btn', 1);}}, 2 * 1000);});
    BypassedByBloggerPemula(/soft3arbi.com/, function() {EnableRCF();let arbi = setInterval(() => {
        if (bp('.progress-done').innerText == '100%') {clearInterval(arbi);ReadytoClick('#continue-button');ReadytoClick('.btn-success.btn', 1);}}, 2 * 1000);});
    BypassedByBloggerPemula(/(coinsward|blogsward).com/, async function() {if (elementExists('.g-recaptcha')) {var bw = bp("input[name=newwpsafelink]");
      redirect(JSON.parse(atob(bw.value)).linkr, false);} else {window.incrementRedirectCount(); await sleep(2000); window.handleButtonClick();}});
    BypassedByBloggerPemula(/(tmail|labgame).io|(gamezizo|fitdynamos).com/, function() {
      if (elementExists('#next')) {DoIfExists('form.text-center', 'submit', 3);DoIfExists('#next', 2);DoIfExists('#glink', 15);} else {DoIfExists('#surl', 5);}});
    BypassedByBloggerPemula(/(exeo|exego).app|(falpus|exe-urls).com|4ace.online/, function() {DoIfExists('#invisibleCaptchaShortlink', 2);DoIfExists('#before-captcha', 'submit', 3);
      let exeo = setInterval(() => {if (bp('.timer').innerText == '0') {clearInterval(exeo);ReadytoClick('#submit-button');}}, 2 * 1000);});
    BypassedByBloggerPemula(/(forexrw7|forex-articles|3rabsports|fx-22|watchtheeye|mooonten).com|gold-24.net|(offeergames|todogame|asxwq).online|msic.site/, function() {
      DoIfExists('.oto > a:nth-child(1)', 1); waitForElm('.oto > a', linkjust => redirect(linkjust.href, false));});
    BypassedByBloggerPemula(/o-pro.online/, function() {waitForElm('#newbutton > a', opo => redirect(opo.href, false));
      waitForElm('a.btn.btn-default.btn-sm', opo2 => redirect(opo2.href, false));});
    BypassedByBloggerPemula(/(kongutoday|proappapk|hipsonyc|teamtechnews).com|yotrickslog.tech/, function() {
      if (BpParams.has('safe')) {meta(atob(BpParams.get('safe')));}});
    BypassedByBloggerPemula(/writedroid.eu.org|modmania.eu.org|writedroid.in/, function() {
      DoIfExists('#shortPostLink', 3);waitForElm("#shortGoToLink", dro => redirect(dro.href, false));});
    BypassedByBloggerPemula(/(travelironguide|businesssoftwarehere|softwaresolutionshere|freevpshere).com/, () => {
      CaptchaDone(() => {DoIfExists('#lview > form', 'submit');});waitForElm('.get-link > a', tig => redirect(tig.href, false));});
    BypassedByBloggerPemula(/linkatla.com/, function() {let katla = bp('head > script:nth-child(7)');let linka = strBetween(katla.text, '"', '"');
      if (elementExists('#redirectButton')) {setTimeout(() => {redirect(atob(linka), false);}, 2 * 1000);}});
    BypassedByBloggerPemula(/claimfreetrx.online/, function() {DoIfExists('#molien', 'submit', 2);DoIfExists('#verify > .mb-2.btn-primary.btn-lg.btn', 3);});
    //BypassedByBloggerPemula(/adclicker\.*|yourihollier.com/, function() {if (location.href.includes('url/')) {const adc = atob(atob(atob(location.hash.slice(1))));
      //redirect(new URLSearchParams(adc).get('url'));} else {}});
    BypassedByBloggerPemula(/(mgame|sportweb|bitcrypto).info/, () => {DoIfExists('.claim-button.btn-lg.btn-primary.btn', 3);window.wpsafegenerate();
      waitForElm("div[id^=wpsafe] > a[rel=nofollow]", bitcry => redirect(strBetween(bitcry.onclick.toString(), `handleClick('`, `')`), false),20,15);});
    BypassedByBloggerPemula(/easylink.gamingwithtr.com/, function() {DoIfExists('#countdown', 2);
      waitForElm('a#pagelinkhref.btn.btn-lg.btn-success.my-4.px-3.text-center', gtr => redirect(gtr.href, false));});
    BypassedByBloggerPemula(/(horoscop|videoclip).info|article24.online|writeprofit.org|docadvice.eu|trendzilla.club/, () => {
      CaptchaDone(() => {window.wpsafehuman();});CheckVisibility('#wpsafe-generate > a', '||', "bp('.base-timer').innerText == '0:00'", () => {window.wpsafegenerate();
        DoIfExists('#wpsafelink-landing2 > .wpsafelink-button', 1);DoIfExists('center > .wpsafelink-button', 3);});});
    BypassedByBloggerPemula('(on-scroll|diudemy|maqal360).com', () => {
      if (elementExists('.alertAd')) {notify('BloggerPemula : Try to viewing another tab if the countdown does not work , turn off Context Menu/Always Ready if you enable it');}
      ReadytoClick('#append a', 2);ReadytoClick('#_append a', 3);elementReady('.alertAd').then(function() {setActiveElement('[data-placement-id="revbid-leaderboard"]');fakeHidden();});});
    BypassedByBloggerPemula(/onlinetechsolution.link/, () => {let Thunder = bp("input[name=newwpsafelink]");setTimeout(() => {redirect(JSON.parse(atob(Thunder.value)).linkr);}, 5 * 1000);});
    BypassedByBloggerPemula(/coinhub.wiki|(vitalityvista|geekgrove).net/, () => {CaptchaDone(() => {ReadytoClick('#btn_link_continue',1);});
      elementReady('.link_code').then(function(element) {GM_setValue("someKey", element.innerText);});ReadytoClick('#link_result_header button',1);ReadytoClick('#btn_link_start:has(.mdi-check)',2);});
    BypassedByBloggerPemula(/stly.link|snaplessons.net|atravan.net|stfly.biz|airevue.net/, () => {
      CaptchaDone(() => {DoIfExists('button[class^=mt-4]');DoIfExists('button.mt-4:nth-child(2)', 3);});DoIfExists('button[class^=rounded]', 2);
      let stly = setInterval(() => {if (bp('.progress-done').innerText == '100%') {clearInterval(stly);ReadytoClick('button.mt-4:nth-child(6)', 1);DoIfExists('button.mt-4:nth-child(2)', 3);}}, 2 * 1000);});
    BypassedByBloggerPemula(/(mangareleasedate|freemodapp|zutiza|phixshop|uskloans|sabkiyojana|dulimo|merikahaniya|kloota|nspaconline|etrovo).com|(myfirstname|ignoupur).in|sarkarisahayata.org|kisannews.net|bloxstrap.cc|90fpsbgmi.one/, () => {let gplinks = setInterval(() => {
      if (bp('#myTimer').innerText == '3') {clearInterval(gplinks);DoIfExists('#VerifyBtn');DoIfExists('#NextBtn', 2);}}, 1 * 1000);});
    BypassedByBloggerPemula(/(remixsounds|helpdeep|thinksrace).com|uprwssp.org/, function() {EnableRCF();
      DoIfExists('.m-2.btn-captcha.btn-outline-primary.btn', 2);DoIfExists('.tpdev-btn', 3);DoIfExists("#tp98 button[class^='bt']", 3); DoIfExists("form[name='tp']", 'submit', 3); DoIfExists('#btn6', 4);});
    BypassedByBloggerPemula(/shrinke\.*|shrinkme\.*|(paid4link|linkbulks|linclik|up4cash|smoner|atglinks).com|(wordcounter|shrink).icu|(dutchycorp|galaxy-link).space|dutchycorp.ovh|pahe.plus|(pwrpa|snipn).cc|paylinks.cloud|oke.io|tinygo.co|tlin.me/, () => {
      CaptchaDone(() => {DoIfExists('#invisibleCaptchaShortlink');});});
    BypassedByBloggerPemula(/revly.click|mitly.us/, () => {
      if (elementExists('#link-view')) {CaptchaDone(() => {DoIfExists('#link-view', 'submit');});} else if (elementExists('button.btn.btn-primary')){DoIfExists('div.col-md-12 form', 'submit', 2);}});
    BypassedByBloggerPemula(/trangchu.news|downfile.site|(techacode|expertvn|ziggame).com|azmath.info|expertvn.com|aztravels.net|top10cafe.se|handydecor.com.vn/, function() {EnableRCF();
      let trangchu = setInterval(() => {if (bp('#monetiza-time').innerText == '0') {clearInterval(trangchu);ReadytoClick('#monetiza');} else if (elementExists('#monetiza-generate')) {window.monetizago();}}, 1 * 1000);});
    BypassedByBloggerPemula(/(askpaccosi|wellness4live|akash.classicoder).com|2the.space|inicerita.online|cryptomonitor.in/, () => {
      var tform = bp('#landing'); redirect(JSON.parse(atob(tform.newwpsafelink.value)).linkr, false);});
    BypassedByBloggerPemula(/(hosttbuzz|policiesreview|blogmystt|wp2hostt|advertisingcamps).com|clk.kim|dekhe.click/, () => {DoIfExists('button.btn.btn-primary', 2);
      DoIfExists('#nextpage', 'submit', 2);DoIfExists('#getmylink', 'submit', 3);CaptchaDone(() => {DoIfExists('.btn-captcha.btn-primary.btn');});});
    BypassedByBloggerPemula(/techyreviewx.com|desiupload.co/, function() {DoIfExists('.downloadbtn.btn-block.btn-primary.btn', 2);
      waitForElm('a.btn.btn-primary.btn-block.mb-4', rex => redirect(rex.href, false));});
    BypassedByBloggerPemula(/(blogsward|coinjest).com/, () => {
      waitForElm('#continueBtn', afBtn => afBtn.click());DoIfExists('#captcha-btn', 4, 'setInterval');
      DoIfExists('.btn-captcha.btn-primary.btn', 8, 'setInterval');});
    BypassedByBloggerPemula(/exactpay.online|neverdims.com|sproutworkers.co|coinsfaucet.fun/, function() {EnableRCF();window.onscroll = BpBlock();window.check2();if (elementExists('#verify')) {
        $('.blog-details').text('Please Answer the Maths Questions First ,Wait until Progress bar end, then Click the Red X Manually');
        elementReady('[name="answer"]').then(function(element) {element.addEventListener('change', window.check3);});}});
    BypassedByBloggerPemula(/(btcpany|zombiebtc|claimfey|thefastpost).com|(panytourism|statepany).online/, function() {
      parent.open = BpBlock();DoIfExists('#link1s-form', 'submit', 1);DoIfExists('#next-step-button', 3);});
    BypassedByBloggerPemula(/playnano.online/, function() {DoIfExists('#watch-link', 2);
      DoIfExists('.watch-next-btn.btn-primary.button', 2);DoIfExists('button.button.btn-primary.watch-next-btn', 5, 'setInterval');});
    BypassedByBloggerPemula(/rekonise.com/, () => {let xhr = new XMLHttpRequest();
      xhr.onload = () => redirect(JSON.parse(xhr.responseText).url);
      xhr.open("GET", "https://api.rekonise.com/social-unlocks" + location.pathname, true);xhr.send();});
    BypassedByBloggerPemula(/acortalink.me/, () => {let acorta = setInterval(() => {let script = bp('body > script');
        if (script) {let text = script.text.trim(); let lines = text.split('\n'); let i = lines.findIndex(x => x.includes('acortalink.me'));
          let link = lines[i + 2].trim().split(',')[6].trim(); if (window[link]) {clearInterval(acorta); redirect(window[link]);}}}, 100);});
    BypassedByBloggerPemula(/tutwuri.id|(besargaji|link2unlock).com/, () => {ReadytoClick('#submit-button',2);ReadytoClick('#btn-2', 3);ReadytoClick('#verify > a ', 2);ReadytoClick('#verify > button ', 2);CaptchaDone(() => {DoIfExists('#btn-3');});});
    BypassedByBloggerPemula(/autodime.com/, () => {CaptchaDone(() => {DoIfExists('#button1');});
      waitForElm('a.btn-hover.color-1.btn-captcha', odim => redirect(odim.href, false));});
    BypassedByBloggerPemula(/amritadrino.com/, function() {
      if (elementExists('.g-recaptcha')) {waitForElm('body > b:nth-child(10) > center:nth-child(4) > a:nth-child(64)', amd => redirect(amd.href, false));} else {waitForElm('#tp-snp2', amBtn => amBtn.click());}});
    BypassedByBloggerPemula(/hunterkiller.me|surflink.tech/, function() {
      waitForElm('div#showw center a.btn.btn-danger.btn-captcha', hun => redirect(hun.href, false));
      waitForElm('div#wpsafe-snp center a', hunt => redirect(hunt.href, false));});
    BypassedByBloggerPemula(/(lyricsbaazaar|ezeviral).com/, () => {CaptchaDone(() => {DoIfExists('#btn6');});
      waitForElm('div.modal-content a', lyri => redirect(lyri.href, false));});
    BypassedByBloggerPemula(/(sekilastekno|miuiku|vebma|majalahhewan).com|crm.cekresi.me|ai.tempatwisata.pro/, async function() {const executor = async () => {let El = window?.livewire?.components?.components()[0];
        while (!El) {await sleep(100); console.log(1); El = window?.livewire?.components?.components()[0];}
        const payload = {fingerprint: El.fingerprint, serverMemo: El.serverMemo, updates: [{payload: {event: 'getData', id: 'whathappen', params: [],}, type: 'fireEvent',}, ],};
        const response = await fetch(location.origin + '/livewire/message/pages.show', {headers: {'Content-Type': 'application/json', 'X-Livewire': 'true', 'X-CSRF-TOKEN': window.livewire_token,},
            method: 'POST', body: JSON.stringify(payload),}); const json = await response.json(); const url = new URL(json.effects.emits[0].params[0]); redirect(url.href);};
      if (location.host === 'wp.sekilastekno.com') {if (elementExists("form[method='post']")) {const a = bp("form[method='post']"); console.log('addRecord...'); const input = document.createElement('input');
          input.value = window.livewire_token; input.name = '_token'; input.hidden = true; a.appendChild(input); a.submit();}
      if (elementExists("button[x-text]")) { console.log('getLink..'); executor();} return;} if (elementExists("div[class='max-w-5xl mx-auto']")) {console.log('Executing..'); executor();}});
    BypassedByBloggerPemula(/socialwolvez.com/, () => {let xhr = new XMLHttpRequest();xhr.onload = () => redirect(JSON.parse(xhr.responseText).link.url);
      xhr.open("GET", "https://us-central1-social-infra-prod.cloudfunctions.net/linksService/link/guid/" + location.pathname.substr(7), true);xhr.send();});
    BypassedByBloggerPemula(/(mobi2c|healthy4pepole|healdad|world2our|mobitaak|te-it|businessnews-nigeria|govaf|fahmysport).com|(hightrip|fx-gd|world-trips|otechno|bluetechno|to-travel).net|(newforex|forexit).online/, function() {
      DoIfExists('.submitBtn', 2);DoIfExists('#go_d', 3);});
    BypassedByBloggerPemula(/bitcotasks.com/, function() {if (location.href.includes('/shortlink/')) {
        let bitco = setInterval(() => {if (bp('.mb-2').innerText == 'Verified!') {clearInterval(bitco);window.continueClicked();}}, 1 * 1000);} else {}});
    BypassedByBloggerPemula(/suaurl.com/, () => {parent.open = BpBlock();CaptchaDone(() => {bp('#comment_form').removeAttribute('target');DoIfExists('#btn-capcha > .b-b', 1);});DoIfExists('#btn > button', 3, 'setInterval');});
    BypassedByBloggerPemula(/letsboost.net/, function() {waitForElm('body > script', () => {let stepDat = BpT('script')[BpT('script').length - 1];
      let stepname = stepDat.innerHTML;let lbDat = JSON.parse(stepname.match(/stepDat = '(.*)';/)[1]); let lbo = lbDat[lbDat.length - 1].url;redirect(lbo,false);});});
    BypassedByBloggerPemula(/oncoin.info|nishankhatri.com.np|quanngon.org/, function() {
      DoIfExists('#my-btn', 2);DoIfExists('#wpsafe-link > .btn-secondary.btn', 2);
      waitForElm('#pro-link', nhk => redirect(nhk.href, false));waitForElm('#wpsafe-link a', hrl => redirect(strBetween(hrl.onclick.toString(), `window.open('`, `', '_self')`), false));});
    BypassedByBloggerPemula('(cryptowidgets|gadgetbuzz|coinsvalue|coinstrend|coinsrise|webfreetools|wanderjourney|languagefluency|giftmagic).net|(freeoseocheck|insurancexguide|funplayarcade|origamiarthub|fitbodygenius|illustrationmaster|selfcareinsights|ecofriendlyz|virtualrealitieshub|brewmasterly).com|coinscap.info|bubblix.eu', () => {
      TrustMe();elementReady('#captcha-result .bg-success').then(ReadytoClick.bind(this, 'button'));elementReady('#loadingDiv[style*="display:block"] button, #loadingDiv[style*="display: block"] button').then(ReadytoClick.bind(this, 'button', 2));
      elementReady('#clickMessage[style*="display: block"], clickMessage[style*="display:block"]').then(function() {setActiveElement('[data-placement-id="revbid-leaderboard"]');fakeHidden();});});
    BypassedByBloggerPemula(/playonpc.online|quins.us|(retrotechreborn|insurelean|ecosolardigest).com|gally.shop/, () => {CaptchaDone(() => {DoIfExists('button#cbt.pfbutton-primary', 1);ReadytoClick('button#cbt.pfbutton-primary', 2);});
      let playonpc = setInterval(() => {if (!elementExists('.h-captcha') && !elementExists('.core-msg.spacer.spacer-top') && bp('#formButtomMessage').textContent == "Well done! You're ready to continue!" && !bp('#cbt').hasAttribute('disabled')) {
          clearInterval(playonpc);DoIfExists('button#cbt.pfbutton-primary', 1);ReadytoClick('button#cbt.pfbutton-primary', 2);}}, 3 * 1000);});
    BypassedByBloggerPemula(/shortit.pw/, () => {if (elementExists('#captchabox')) {
        notify('IMPORTANT Note By BloggerPemula : Please Solve the Hcaptcha for Automatically , Dont Solve the Solvemedia . Regards...');}
      DoIfExists('.pulse.btn-primary.btn', 3);CaptchaDone(() => {DoIfExists('#btn2');});});
    BypassedByBloggerPemula(/short.croclix.me|adz7short.space/, function() {setInterval(function() {if ($("#link").length > 0) {ReadytoClick("#link");}}, 500);
      setInterval(function() {if ($("input#continue").length > 0) {ReadytoClick("input#continue");} if ($("a#continue.button").length > 0) {ReadytoClick("a#continue.button");}}, 9000);
      setTimeout(function() {if ($("#btn-main").length < 0) return;ReadytoClick("#btn-main");}, 5000);});
    BypassedByBloggerPemula(/adshnk.com|adshrink.it/, () => {let adsh = setInterval(() => {
        if (typeof window._sharedData == "object" && 0 in window._sharedData && "destination" in window._sharedData[0]) {clearInterval(adsh);
          document.write(window._sharedData[0].destination);redirect(document.body.textContent);
        } else if (typeof window.___reactjsD != "undefined" && typeof window[window.___reactjsD.o] == "object" && typeof window[window.___reactjsD.o].dest == "string") {clearInterval(adsh);redirect(window[window.___reactjsD.o].dest);}});});
    BypassedByBloggerPemula(/ify.ac/, function() {window.open_href();});
    BypassedByBloggerPemula(/lanza.me/, () => waitForElm('a#botonGo', lz => redirect(lz.href, false)));
    BypassedByBloggerPemula(/lifeezee.com/, () => waitForElm('.get-link', lifz => redirect(lifz.href)));
    BypassedByBloggerPemula(/lolinez.com/, () => waitForElm('p#url a', lol => redirect(lol.href, false)));
    BypassedByBloggerPemula(/file-upload.in/, () => waitForElm('#getlink', fui => redirect(fui.href, false)));
    BypassedByBloggerPemula(/linksly.co/, () => waitForElm('div.col-md-12 a', lsl => redirect(lsl.href, false)));
    BypassedByBloggerPemula(/appsinsta.com/, function() {waitForElm('.yu-blue.yu-btn', apBtn => apBtn.click());});
    BypassedByBloggerPemula(/apkadmin.com/, () => waitForElm('div.text.text-center a', apk => redirect(apk.href)));
    BypassedByBloggerPemula(/sugarona.com/, function() {waitForElm('a#my-btn', sgr => redirect(sgr.href, false));});
    BypassedByBloggerPemula(/cekip.site/, () => waitForElm('a#aGo.badge.bg-success', cek => redirect(cek.href, false)));
    BypassedByBloggerPemula(/techleets.xyz|sharphindi.in/, () => waitForElm('a#tp-snp2', tle => redirect(tle.href, false)));
    BypassedByBloggerPemula(/amanguides.com/, () => waitForElm('#wpsafe-link > .bt-success', ag => redirect(ag.href, false)));
    BypassedByBloggerPemula(/8tm.net/, () => waitForElm('a.btn.btn-secondary.btn-block.redirect', tm => redirect(tm.href, false)));
    BypassedByBloggerPemula(/cpmlink.net/, () => waitForElm('a#btn-main.btn.btn-warning.btn-lg', cpm => redirect(cpm.href, false)));
    BypassedByBloggerPemula(/noodlemagazine.com/, () => waitForElm('a#downloadLink.downloadBtn', mag => redirect(mag.href, false)));
    BypassedByBloggerPemula(/paycut.pro/, () => {if (location.href.includes('/ad/')) {location = location.href.replace('ad/', '');}});
    BypassedByBloggerPemula(/mohtawaa.com/, () => waitForElm('a.btn.btn-success.btn-lg.get-link.enabled', moht => redirect(moht.href, false)));
    BypassedByBloggerPemula(/rockmods.net/, function() {if (location.href.includes('/rblink.html') && BpParams.has('url')) {meta(atob(BpParams.get('url')));}});
    BypassedByBloggerPemula(/xonnews.net|toilaquantri.com|share4u.men|camnangvay.com/, () => waitForElm('div#traffic_result a', xon => redirect(xon.href, false)));
    BypassedByBloggerPemula(/boost.ink/, () => fetch(location.href).then(bo => bo.text()).then(html => redirect(atob(html.split('bufpsvdhmjybvgfncqfa="')[1].split('"')[0]))));
    BypassedByBloggerPemula(/blog.textpage.xyz/, () => waitForElm('#wpsafe-link1 a', bt => redirect(strBetween(bt.onclick.toString(), `window.open('`, `', '_blank')`), false)));
    BypassedByBloggerPemula(/foodupe.com/, function() {if (elementExists('.containerpanel')){let fdp = bp('#donead').href;setTimeout(() => {redirect(fdp,false);}, 2 * 1000);}});
    BypassedByBloggerPemula(/(cricketgurupro|travelkuku).com/, function() {DoIfExists("form[name='tp']", 'submit', 3);waitForElm('#page > center > a', cgp => redirect(cgp.href, false));});
    BypassedByBloggerPemula(/mirrored.to/, () => {waitForElm('div.col-sm.centered.extra-top a', mirr => redirect(mirr.href, false)); waitForElm('div.centerd > a', mir => redirect(mir.href, false));});
    BypassedByBloggerPemula(/sub2unlock.net/, function() {if (elementExists('.linkDiv_btns.col-xs-12.col-sm-12.col-md-12')){let stu = bp('#theLinkID').textContent;setTimeout(() => {redirect(stu,false);}, 2 * 1000);}});
    BypassedByBloggerPemula(/(financenube|mixrootmods|pastescript|trimorspacks|mealcold).com/, () => {waitForElm('#wpsafe-link a', cdr => redirect(strBetween(cdr.onclick.toString(), `window.open('`, `', '_self')`), false));});
    BypassedByBloggerPemula(/mboost.me/, function() {if (elementExists('#firstsection')){let mbo = bp('#__NEXT_DATA__');let mbm = JSON.parse(mbo.textContent).props.pageProps.data.targeturl;setTimeout(() => {redirect(mbm,false);}, 2 * 1000);}});
    BypassedByBloggerPemula(/(disheye|kreatifparenting|phimne|admediaflex|cdrab).com|(gurumu|wpcheap|izseo|adcrypto|daycash).net|(ecq|oncoin).info|savego.org|hbz.us|(djqunjab|alpha-links).in|datacheap.io/, () => waitForElm('#wpsafelink-landing > input', dis => redirect(JSON.parse(atob(dis.value)).linkr, false)));
    BypassedByBloggerPemula(/mbantul.my.id|crypto-fi.net|claimcrypto.cc|xtrabits.click|(cempakajaya|web9academy|onlineincoms|allsoftdrivers|tribuncrypto|poketoonworld|bioinflu|pubgquotes|bico8).com|(techleets|ourcoincash|studyis|healthysamy).xyz/, function() {
      var bypasslink = atob(`aH${bp("#landing [name='go']").value.split("aH").slice(1).join("aH")}`); redirect(bypasslink, false);});
    BypassedByBloggerPemula(/autofaucet.dutchycorp.space/, function () {let autoRoll = false;if (window.location.href.includes('/roll_game.php')) {window.scrollTo(0, 9999);
    if (!bp('#timer')) {CaptchaDone(() => {if (bp('.boost-btn.unlockbutton') && autoRoll === false) {bp('.boost-btn.unlockbutton').click();autoRoll = true;}CheckVisibility('#claim_boosted', () => {bp('#claim_boosted').click();});});} else {
      setTimeout(() => {window.location.replace('https://autofaucet.dutchycorp.space/coin_roll.php');}, 3 * 1000);}}if (window.location.href.includes('/coin_roll.php')) {window.scrollTo(0, 9999);
    if (!bp("#timer")) {CaptchaDone(() => {if (bp('.boost-btn.unlockbutton') && autoRoll === false) {bp('.boost-btn.unlockbutton').click();autoRoll = true;}CheckVisibility('#claim_boosted', () => {bp('#claim_boosted').click();});});} else {setTimeout(() => {window.location.replace('https://autofaucet.dutchycorp.space/ptc/wall.php');}, 3 * 1000);}}
    if (window.location.href.includes('/ptc/wall.php')) {var ptcwall = BpAll(".col.s10.m6.l4 a[name='claim']");if (ptcwall.length >= 1) {ptcwall[0].style.backgroundColor = 'red';let match = ptcwall[0].onmousedown.toString().match(/'href', '(.+)'/);let hrefValue = match[1];
      setTimeout(() => {window.location.replace('https://autofaucet.dutchycorp.space' + hrefValue);}, 3 * 1000);} else {CheckVisibility('div.col.s12.m12.l8 center div p', () => {setTimeout(() => {window.location.replace('https://autofaucet.dutchycorp.space/ptc/');}, 3 * 1000);});}}
    if (location.href.includes('autofaucet.dutchycorp.space/ptc/')) {console.log('Viewing Available Ads');if (elementExists('.fa-check-double')) {console.log('All Available Ads Watched');
      setTimeout(() => {window.location.replace('https://autofaucet.dutchycorp.space/dashboard.php');}, 3 * 1000);}CaptchaDone(() => {CheckVisibility('#submit_captcha', () => {bp("button[type='submit']").click();});});}});
    const headers = {"Content-Type": "application/json", "apikey": APIKEY};elementReady('iframe[data-hcaptcha-response]').then(async function(element) {CheckVisibility('iframe[data-hcaptcha-response]','&&',"APIKEY && cfg.get('hCaptcha')",
    async () => {const settings = Object.fromEntries(new URLSearchParams(element.src));let data = await Request("https://token.nocaptchaai.com/token", {method: "POST",headers,data: JSON.stringify({url: settings.host,type: "hcaptcha",sitekey: settings.sitekey,softid: "bloggerPemula-diego"})});
    const url = data.url;while (data.status != "processed") {await sleep(1);data = await Request(url, {headers,responseType: 'json'});console.log(data);}
    window.postMessage(JSON.stringify({"source": "hcaptcha","label": "challenge-closed","id": settings.id,"contents": {"event": "challenge-passed","response": data.token,"expiration": 120}}));});});


}})();

// ----- Bypass Acortalink.me ( Taken from AdGuard https://github.com/AdguardTeam/AdguardFilters/commit/61d9949022b428939b5be4243b0e5331ea64afcb) -----
// used in: hackstore.fo
(function() {
    'use strict';

    if (/acortalink.me/.test(window.location.href)) {

        //Try to click the button after the page is fully loaded
        window.addEventListener('load', function() {
            const popupsToRedirects = () => window.open = (url, target, features) => (window.location.href = url, window);
            popupsToRedirects();

            let button = document.querySelector('#contador');
            if (button) {
                button.click();
            }
        })

        //Bypass logic by Adguard Team - https://github.com/AdguardTeam/AdguardFilters/commit/61d9949022b428939b5be4243b0e5331ea64afcb
        window.addEventListener("message", (e => {
            e?.data?.includes("__done__") && e?.data?.length < 9 && Object.defineProperty(e, "source", {
                value: ""
            })
        }), !0);
        const e = new MutationObserver((() => {
            document.querySelector("a.button#contador") && (e.disconnect(), setTimeout((() => {
                postMessage("__done__")
            }), 100))
        }));
        e.observe(document, {
            childList: !0,
            subtree: !0
        })

    }

})();
// ----- ----- -----

// ----- bypass.vip and bypass.city APIs------
(function() {
    'use strict';
    const admavenRegex = /^https:\/\/((bleleadersto|tonordersitye|daughablelea|mdlinkshub).com)\/s\?.*$/;
    const linkvertiseRegex = /^https:\/\/linkvertise\.com\/.+$/;
    const lootlinkRegex = /^(https?:\/\/)(loot-link.com|loot-links.com|lootlink.org|lootlinks.co|lootdest.(info|org|com)|links-loot.com|linksloot.net)\/s\?.*$/

    const redirect = (finalUrl) => typeof redirectWithMessage === 'function' ? redirectWithMessage(finalUrl) : window.location.assign(finalUrl);

    // Linkvertise easy case
    if (linkvertiseRegex.test(window.location.href) && window.location.search.includes('r=')) {
        const rParam = new URLSearchParams(window.location.search).get('r');
        if (rParam) {redirect(atob(rParam));};

    // Linkvertise hard case and Admaven using bypass.city
    } else if (admavenRegex.test(window.location.href) || linkvertiseRegex.test(window.location.href) || lootlinkRegex.test(window.location.href)) {
        redirect(`https://adbypass.org/bypass?bypass=${encodeURIComponent(window.location.href)}`);
    }
})();
// ----- ------ ----------


// ----- Bypass bstlar ------
// adapted to userscript from code by harryitz for FastForward
// https://github.com/FastForwardTeam/FastForward/commit/89fb43ce12718b3d83edb0eb5abec4c683c16925
(function() {
    'use strict';

    if (/bstlar.com/.test(window.location.href)) {

        function getCookie(name) {
            let value = '; ' + document.cookie;
            let parts = value.split('; ' + name + '=');
            if (parts.length === 2) return parts.pop().split(';').shift();
        }

        async function handleRedirect(data) {
            if (data.currentTarget?.responseText?.includes('tasks')) {
                const response = JSON.parse(data.currentTarget.responseText);
                const userAgent = navigator.userAgent;
                const XSRF_TOKEN = getCookie('XSRF-TOKEN');
                const boostellar_session = getCookie('boostellar_session');
                const PfufeQwMeP6og9Poi7DmjbGJCcYhyXKQhlPnQ4Ud = getCookie('PfufeQwMeP6og9Poi7DmjbGJCcYhyXKQhlPnQ4Ud');
                const cf_clearance = getCookie('cf_clearance');
                const task_request = await fetch('https://bstlar.com/api/link-completed', {
                    method: 'POST',
                    headers: {
                        accept: 'application/json, text/plain, */*',
                        authorization: 'null',
                        cookie: `XSRF-TOKEN=${XSRF_TOKEN}; boostellar_session=${boostellar_session}; PfufeQwMeP6og9Poi7DmjbGJCcYhyXKQhlPnQ4Ud=${PfufeQwMeP6og9Poi7DmjbGJCcYhyXKQhlPnQ4Ud}; cf_clearance=${cf_clearance}`,
                        origin: 'https://bstlar.com',
                        pragma: 'no-cache',
                        priority: 'u=1, i',
                        referer: 'https://bstlar.com/hV/krampus',
                        'user-agent': userAgent,
                        'x-xsrf-token': XSRF_TOKEN,
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        link_id: response['link']['id']
                    })
                });

                if (task_request.status !== 200) return;
                const task_response = await task_request.text();

                const redirect = (finalUrl) => typeof redirectWithMessage === 'function' ? redirectWithMessage(finalUrl) : window.location.assign(finalUrl);
                redirect(task_response);
            }
        }

        function interceptXHR() {
            const open = XMLHttpRequest.prototype.open;
            XMLHttpRequest.prototype.open = function() {
                this.addEventListener("load", function(data) {
                    handleRedirect(data);
                });
                open.apply(this, arguments);
            };
        }

        interceptXHR();
    }

})();
// ----- ------ ----------

//---Bypass.city clickable result----
(function() {
    'use strict';
    if (/^https:\/\/(bypass\.city|adbypass\.org)\/bypass\?bypass=.*$/.test(window.location.href)) {
        function checkForResolvedUrl() {
            const xpath = '/html/body/div[1]/main/div/main/div[1]/div/div[2]/div/p';
            const pElement = document.evaluate(xpath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            if (pElement && pElement.innerText.includes('The resolved url is: ')) {
                const resolvedUrl = pElement.innerText.split('The resolved url is: ')[1];
                if (resolvedUrl && !resolvedUrl.endsWith('...')) {
                    const clickableLink = document.createElement('a');
                    clickableLink.href = `https://${resolvedUrl}`;
                    clickableLink.innerText = `The resolved url is: ${resolvedUrl}`;
                    clickableLink.style.color = '#3366CC';
                    clickableLink.style.display = 'block';
                    pElement.innerHTML = ''; // Clear the original text
                    pElement.appendChild(clickableLink);
                }
                clearInterval(intervalId);
            }
        }
        const intervalId = setInterval(checkForResolvedUrl, 2000);
    }
})();
//-------


// ----- Extra bypasses -----
(function() {
    'use strict';

    const url = window.location.href
    const isValidUrl = url => /^(?:https?|ftp):\/\/(?:\w+\.){1,3}\w+(?:\/\S*)?$/.test(url);
    function redirect(finalUrl) {
        //if (isValidUrl(finalUrl)) {
            //typeof redirectWithMessage === 'function' ? redirectWithMessage(finalUrl) : window.location.assign(finalUrl);
            window.location.assign(finalUrl);
        //} else {
        //    showAlert("Invalid URL: " + finalUrl, 'error', 3000, '', 'secondary');
        //}
    }
    const fastRedirect = (url) => window.location.assign(url);
    const showClickMsg = () => typeof showAlert === 'function' ? showAlert("Button clicked...", 'success', 1000, '', 'secondary') : console.log("Button clicked...");
    const clickElementBySelectorWithMsg = (selector) => { document.querySelector(selector).click(); showClickMsg(); };
    const clickElementBySelector = (selector) => { clickElementBySelectorWithMsg(selector); };
    const clickElementWithMsg = (element) => { element.click(); showClickMsg(); };
    const clickElement = (element) => { clickElementWithMsg(element); };
    const getParam = (url, param) => new URLSearchParams(url).get(param);
    const rot13 = str => str.replace(/[A-Za-z]/g, char => String.fromCharCode((char.charCodeAt(0) % 32 + 13) % 26 + (char < 'a' ? 65 : 97)));
    const popupsToRedirects = () => window.open = (url, target, features) => (window.location.href = url, window);
    const afterDOMLoaded = (callback) => document.addEventListener('DOMContentLoaded', callback);
    const afterWindowLoaded = (callback) => window.addEventListener('load', callback);
    
    const clickIfExists = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button) { clearInterval(intervalId); clickElement(button); } }, 1000); };
    const redirectIfExists = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button.href && isValidUrl(button.href)) { clearInterval(intervalId); redirect(button.href) } }, 500); };
    const clickIfExistsNonStop = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector + ':not(.disabled)'); if (button) { clickElement(button); } }, 500); };
    const redirectIfNotDisabled = (selector) => { let intervalId = setInterval(() => { let linkButton = document.querySelector(selector + ':not(.disabled)'); if (linkButton && !linkButton.href.includes('/undefined') && !linkButton.href.includes('javascript:')) { clearInterval(intervalId); setTimeout(function() {redirect(linkButton.href);}, 500) } }, 500); };
    const clickIfNotDisabled = (buttonSelector) => { let intervalId = setInterval(() => { let button = document.querySelector(buttonSelector); if (!button.hasAttribute('disabled') && !button.classList.contains('disabled')) { clearInterval(intervalId); setTimeout(function() {clickElement(button);}, 500) } }, 500); };
    const checkElementVisible = element => element !== null && !!(element.offsetWidth || element.offsetHeight || element.getClientRects().length) && (!element.getAttribute('style') || !element.getAttribute('style').includes('display:none'));
    const clickIfVisible = selector => { afterDOMLoaded(function() { let intervalId = setInterval(() => { let element = document.querySelector(selector); if (checkElementVisible(element)) { clearInterval(intervalId); element.click(); showClickMsg(); } }, 1000); }); };
    const preventForcedFocusOnWindow = () => {window.mouseleave = true; window.onmouseover = true; document.hasFocus = function() {return true;}; Object.defineProperty(document, 'webkitVisibilityState', {get() {return 'visible';}});
        Object.defineProperty(document, 'visibilityState', {get() {return 'visible';}}); window.addEventListener('visibilitychange', function(e) {e.stopImmediatePropagation();}, true, true);
        window.addEventListener('focus', onfocus, true);document.addEventListener('visibilitychange', function(e) {e.stopImmediatePropagation();}, true, true); Object.defineProperty(document, 'hidden', {get() {return false;}});};

    //peliculasgd.net, animesgd.net, club-hd.com, librolandia.net, pelishd4k.com, programasvirtualespc.net, pasteprivado.blogspot.com
    /(mundopolo.net|myfirstdollar.net|adsense.tupaste.top|acorta2.com|web.admoneyclick.net|acortaphd.live|onlypc.net|link.manudatos.com)/.test(url) ? redirect(decodeURIComponent(atob(atob(atob(url.split('#!')[1]))))) : null;

    // elitetorrent.com tomadivx.net infomaniakos.net divxatope.net
    function caesarDecipher(str) {
        const shift = 13;
        return str.replace(/[a-zA-Z]/g, char => {
          const base = char <= 'Z' ? 65 : 97;
          return String.fromCharCode((char.charCodeAt(0) - base - shift + 26) % 26 + base);
        });
    }
    if (/(desbloquea|drivelinks).me|(acortame-esto|recorta-enlace|enlace-protegido|super-enlace).com|short-info.link/.test(url)){
        const encodedURL = url.split('/s.php?i=')[1];
        const decodedURL = atob(atob(atob(atob(atob(encodedURL)))));
        const finalURL = caesarDecipher(decodedURL); // or rot13(decodedURL)
        redirect(finalURL);
    }

    // AdClicker
    if (/(adclicker.(io|info)|(discoveryultrasecure|yourihollier).com)\/url/.test(url)){
        let decodedUrl = decodeURIComponent(atob(atob(atob(url.split('/url/#')[1]))));
        if (decodedUrl.includes('&amp;url=')) {decodedUrl = decodedUrl.split('&amp;')[1];}
        let urlParam = new URLSearchParams(decodedUrl).get('url');
        if (urlParam) {redirect(urlParam);}
    }

    // pelishd4k.com
    /altearnativasa.com\/\#/.test(url) ? redirect(decodeURIComponent(atob(atob(atob(url.split('/#')[1]))).split('&url=')[1].split('&')[0])) : null;

    // mayas.travel used in fiuxy2.co
    /(mayas.travel|eldiario24hrs.com|comomedir.com|aplicacionpara.org)\/api/.test(url) ? redirect(decodeURIComponent(url.split('&url=')[1].split('&')[0])) : null;
    /(mayas.travel|eldiario24hrs.com|comomedir.com|aplicacionpara.org)\/\#/.test(url) ? redirect(atob(atob(atob(url.split('/#')[1]))).split('&url=')[1].split('&')[0]) : null;

    // descargasdirecta.com
    /playpastelinks.com/.test(url) ? afterDOMLoaded(function() {setTimeout(() => { document.querySelector('#btn-redirect').click(); }, 8000)}) : null;
    /mh.gourlpro.com/.test(url) ? redirect(atob(atob(atob(url.split('#')[1])))) : null;

    // peliculasmf.com
    /tumangasdd.com/.test(url) ? redirect(decodeURIComponent(atob(atob(atob(url.split('#')[1]))).split('url=')[1])) : null;

    // dw-anime.net
    /dw-anime.net\/short\/\?anonym=/.test(url) ? redirect(atob(url.split('?anonym=')[1])) : null;

    //leak.sx & pornleaks.in
    /comohoy.com/.test(url) ? redirect(atob(url.split('?url1=')[1])) : null;
    /privatenudes.com\/model/.test(url) ? afterDOMLoaded(function() {redirect(atob(document.querySelector('.btn-custom.btn-block.noads').href.split('?url=')[1]))}) : null;

    // sexyforums.com
    /sexyforums.com\/redirect/.test(url) ? redirect(atob(url.split('?to=')[1]).replace('amp;', '')) : null;

    // forum.sexyegirls.to, forum.sorrymother.to
    /forum.(sexyegirls|sorrymother).to\/redirect\?to=/.test(url) ? redirect(atob(url.split('?to=')[1])) : null;

    //sphinxanime.com
    /sphinxanime.com\/short/.test(url) ? redirect(atob(url.split('?anonym=')[1])) : null;

    //japanpaw.com
    /japanpaw.com\/out/.test(url) ? redirect(atob(url.split('out/?')[1])) : null;
    /paste.japan-paw.net\/\?v=/.test(url) ? afterDOMLoaded(function() {
        document.querySelectorAll('a[href*="https://shrinkme.io/st?api="]').forEach(link => {
            link.href = decodeURIComponent("https://" + link.href.split('?s=')[1]);
        }); }) : null;

    // mega-mkv.com
    /pastesmkv.xyz\/\?v=/.test(url) ? afterWindowLoaded(function() {
        document.querySelectorAll('a[href*="https://shrinkearn.com/full?api="]').forEach(link => {
            link.href = atob(link.href.split('&url=')[1].split('&')[0]);
        }); }) : null;

    //intercambiosvirtuales.org
    /1v.to\/t/.test(url) ? redirect(atob(atob(atob(atob( atob(url.split('/t/')[1]).replace('+P', '') ))))) : null;

    // tucinehd.com
    /tucinehd.com\/links/.test(url) ? afterDOMLoaded(redirectIfExists('#link')) : null;

    //mandranime.com
    /ikramlar.online|segurosdevida.site/.test(url) ? afterDOMLoaded(function() { 
        redirect(atob(document.querySelector('#wpsafe-link > a:nth-child(1)').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1]); 
    }) : null;

    //anime-world.in 2nd step
    /link.unlockner.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn.get-link')}) : null;

    //atozcartoonist.me
    /(cybercityhelp|akcartoons).in/.test(url) ? afterDOMLoaded(function() {
        const formSubmitButton = document.querySelector('#tp982');
        if (formSubmitButton) {
            document.querySelector('#username').value = 'https://www.thomann.de/' + Math.random().toString(36).substring(2, 12);
            formSubmitButton.click();
        } else {
            redirect(document.querySelector('a[href*="go.moonlinks.in"]'));
        }
    }) : null;
    /go.moonlinks.in/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.btn')}) : null;

    // animedekho.in
    /secure.moderngyan.com/.test(url) ? afterDOMLoaded(function() {
        clickWithDelay('a.button', 1000);
        clickWithDelay('#notarobot', 2000);
        redirectIfExists('#btn7');
    }) : null;
    // clicked by uBO already: /earning.bankshiksha.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#tp-snp2')}) : null;
    /earnbox.sattakingcharts.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#tp-snp2')}) : null;
    /set.seturl.in/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // seturl.in used by animedekho.in
    /psccapk.in|secure.bgmiupdate.com.in|money.hustlershub.in|rg.sattakingcharts.in|payalgaming.co.in/.test(url) ? afterDOMLoaded(function() {
        window.count = 0;
        clickIfExists('#tp-snp2');
        clickIfExists('#cross-snp2');
    }) : null;

    // linkneverdie.net
    /techtnet.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#invisibleCaptchaShortlink')}) : null;
    /techtnet.com/.test(url) ? afterDOMLoaded(function() {redirectIfExists('#originalLink')}) : null;

    //shrinkme.us
    /shrinkme.(us|site|cc|vip|dev|ink)/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#invisibleCaptchaShortlink')}) : null;

    // /travelkuku.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn2')}) : null;

    //freecoursesite.com 2nd step - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/43
    /myshrinker.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#invisibleCaptchaShortlink')}) : null;
    /myshrinker.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    //test.shrinkurl.org https://github.com/FastForwardTeam/FastForward/issues/1365
    /test.shrinkurl.org/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#invisibleCaptchaShortlink')}) : null;
    /test.shrinkurl.org/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // fc-lc
    /^https:\/\/(fc-lc.xyz)\/.*$/.test(url) ? afterWindowLoaded(function() {
        clickIfExists('#invisibleCaptchaShortlink');
    }) : null; 
    //type 1:https://fc-lc.xyz/aPxvk which leads to fitdynamos.com - https://github.com/uBlockOrigin/uAssets/pull/20826 - https://github.com/uBlockOrigin/uAssets/issues/25210
    //(different from type2: https://fc-lc.xyz/ymUtEPUB which leads to gamezizo.com, https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-8736277, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/162)
    /^https:\/\/(fitdynamos.com|labgame.io)\/.*$/.test(url) ? afterWindowLoaded(function() {
        clickIfExists('#next');
        clickIfExists('#scroll:not(.hidden)');
        clickIfExists('#glink:not(.hidden)');
        clickIfExists('#surl');
    }) : null;

    //cpmlink.net
    /cpmlink.net\/go/.test(url) ? afterDOMLoaded(function() {redirectIfExists('#btn-main')}) : null;

    //kingshortener.com (seen used in reidostorrents.com)
    /kingshortener.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#invisibleCaptchaShortlink')}) : null;
    /kingshortener.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;

    //shareus.io https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/2
    /shareus.io/.test(url) ? afterDOMLoaded(function() {clickIfExistsNonStop('#root > div > main > div.main-container-1 > div.main-container-2 > div:nth-child(1) > div.adunit-container > button')}) : null;

    // shareus.io (type 2) https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-8501665
    if (/shareus\.io\/go\?sid=/.test(url)){
      popupsToRedirects();
      let selector = '#custom-root > div > div:nth-child(3) > div.flex.align-center.space-between.button-texts > button.MuiButtonBase-root.MuiButton-root.MuiButton-contained.MuiButton-containedPrimary.MuiButton-sizeLarge.MuiButton-containedSizeLarge.MuiButton-root.MuiButton-contained.MuiButton-containedPrimary.MuiButton-sizeLarge.MuiButton-containedSizeLarge.css-s7ybtv';
      afterDOMLoaded(function() {setTimeout(() => { clickIfExists(selector);}, 1000);})
    }

    //verpeliculasonline.org && subtituladas.com
    /(verpeliculasonline.org|subtituladas.com)\/enlace/.test(url) ? afterDOMLoaded(function() {redirect(document.getElementById('link').href.split('?s=')[1])}) : null;

    //maxcine.net
    /links.cuevana.ac\/short/.test(url) ? afterDOMLoaded(function() {
        let extractedUrl = document.documentElement.innerHTML.split('\n').find(line => line.includes("document.getElementById('contador').href = 'htt")).split("href")[1].match(/'([^']+)'/)[1];
        extractedUrl.includes('?s=') ? redirect(extractedUrl.split('?s=')[1]) : redirect(extractedUrl);
    }) : null;

    // monoschinos3.com
    /monoschinos.club/.test(url) ? afterDOMLoaded(function() { 
        redirect(atob(document.querySelector('#wpsafe-link > a').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1].replace(/\\/g, ""));
    }) : null;

    //ouo.io
    /ouo.io/.test(url) && url.includes('?s=') ? redirect(decodeURIComponent(url.split('?s=')[1])) : null;
    /ouo.io/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#btn-main')}) : null;

    //cuty.io - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/46
    /exeo.app|mrgec.com|cety.app|cuty.me|cutyion.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#submit-button')}) : null;

    //oko.sh
    /lnbz.la/.test(url) ? afterDOMLoaded(function() {timeSec = 0; afterElementVisible('form', function() {clickIfExists('button#getlink.btn-success');}) }) : null;

    // tii.la oko.sh final step
    /dekhe.click|indianshortner.com|lnbz.la|oii.la|falpus.com|4ace.online|tii.la|oko.sh|tpi.li|shrinke.me|clk.(wiki|kim)|techy.veganab.co|atglinks.com|linx.cc|get.megaurl.in|wordcounter.icu|exeo.app|pwrpa.cc|(go|get).megafly.in|birdurls.com|blog.graphicuv.com|try2link.com|owllink.net|oei.la|iir.la|tvi.la|exego.app|link.theflash.eu.org|get.instantearn.in|mrproblogger.com|exe-urls.com|linkjust.com/.test(url) ? afterDOMLoaded(function() {
        preventForcedFocusOnWindow();
        redirectIfNotDisabled('a.get-link');
    }) : null;

    // shon.xyz, seen in mega-descargas-serie.blogspot.com
    /shon.xyz/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn-main')}) : null;

    //vegamovies, worldfree4u, desiremovies.cymru, hdhub4u.capetown, moviesdrive.world ... https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-8508217
    const redirectOrClickIfExistsEnabledWithDelay = (selector) => { afterDOMLoaded(function() { //Wait for the page to load
        let intervalId = setInterval(() => { //Check every 0.5s
          let button = document.querySelector(selector + ':not(.disabled)'); //Check the element is not disabled
          if (button) {setTimeout(() => { isValidUrl(button.href) ? redirect(button.href) : clickElement(button);}, 100);} //Redirect or click, with a 0.1s delay
        }, 500);});};
    if (/((infytips|remixodiadj|bgmiaimassist).in|(cybertyrant|profitshort|technorozen|bestadvise4u|newztalkies|aiotechnical|cryptonewzhub|techvybes|wizitales|101desires|gdspike|caronwhaley|maxxfour|thewizitale|inventoryidea|gamerxyt|betsatta|stockwallah|gtxhosty|anyrojgar).com|mphealth.online|hubdrive.me|advisecreate.fun|courselinkfree.us|10desires.(org|net)|theapknews.shop|trendzguruji.me|speedynews.xyz|nzarticles.pro|offerboom.top|kvkparbhani.org)/.test(url)){
        if (url.includes('?r=')) redirect(atob(url.split('?r=')[1]));
        else redirectOrClickIfExistsEnabledWithDelay('.rd_btn');
    }

    // hdhub4u.capetown
    /bgmiaimassist.in|(stockwallah|inventoryidea).com/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('a#verify_btn');
        redirectIfExists('a#verify_btn');
    }) : null;
    

    // hubcloud telegram link - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/185
    // /bloggingvector.shop\/re2/.test(url) ? redirect(atob(url.split('/re2/')[1])) : null;
    /hubcloud.club\/tg\/go.php\?re=/.test(url) ? afterDOMLoaded(function() { document.body.innerHTML.trim().includes('Invalid Request - Please Come through Links again') ? setTimeout(() => {window.location.reload()}, 1500) : null}) : null;

    // desiremovies.cymru
    /gyanigurus.net\/view/.test(url) ? afterDOMLoaded(function() {clickIfExists('#show_button')}) : null;

    // dramaday.me - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/21
    /besargaji.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn-1')}) : null;
    /besargaji.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn-2')}) : null;
    /moneyblink.com\/ready\/go\?u=/.test(url)? redirect(atob(url.split('?u=')[1])) : null;

    // dramaday.me -  linkspy.cc & droplink.co/st?api=...&url=... concatenated
    // ovagames.com - linkspy.cc & clicksfly.com|shrinkme.io|clk.sh|shrinkearn.com|clk.asia|clk.wiki concatenated - https://github.com/FastForwardTeam/FastForward/issues/1352
    // l4s.cc
    if (/linkspy.cc/.test(url) && url.includes('aHR0')) {
        const decodedUrl = atob('aHR0' + url.split('aHR0')[1]);
        const urlParam = getParam(decodedUrl,'url');
        if (!urlParam) { // general case
            fastRedirect(decodedUrl);
        } else if (isValidUrl(urlParam)) { //case for dramaday.me
            fastRedirect(urlParam);
        } else if (isValidUrl(atob(urlParam))) { //case for ovagames.com
            fastRedirect(atob(urlParam));
        }
    }
    /www.ovagames.com\/.*\.html$/.test(url) ? afterWindowLoaded(function() {
        document.querySelectorAll('a[href*="https://l4s.cc/q/e/1f/aHR0"]').forEach(link => {
            let decodedUrl = atob(link.getAttribute('href').split('/1f/')[1]);
            let urlParam = getParam(decodedUrl,'url');
            urlParam ? link.href = atob(urlParam) : link.href = decodedUrl;
        }); }) : null;
    /dramaday.me\/[^\/]+\/$/.test(url) ? afterWindowLoaded(function() {
        document.querySelectorAll('a[href*="https://l4s.cc/q/e/482/"]').forEach(link => {
            link.href = atob(link.getAttribute('href').split('/482/')[1]);
        }); }) : null;

    //dropgalaxy https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/2
    /dropgalaxy.(com|co)\/drive/.test(url) ? afterDOMLoaded(function() {clickIfExists('#method_free')}) : null; //1st page
    // /dropgalaxy.(com|co)\/drive/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#downloadbtn')}) : null; //2nd page
    // /dropgalaxy.(com|co)\/drive/.test(url) ? afterDOMLoaded(function() {  //3rd page
    //     let intervalId = setInterval(function() {// Keep checking if link is available, every 1s
    //         let downloadUrl = document.getElementById('dllink').getAttribute('action');
    //         if (downloadUrl) {
    //             clearInterval(intervalId);
    //             alert('Press OK to go to the download link:\n' + downloadUrl);
    //             redirect(downloadUrl)
    //         }
    //     }, 1000);
    // }) : null;

    // short-ly.co https://github.com/FastForwardTeam/FastForward/issues/1363
    /short-ly.co/.test(url) ? afterDOMLoaded(function() {redirectIfExists('.btn-secondary')}) : null;

    // multimovies.space, https://github.com/FastForwardTeam/FastForward/issues/1434, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/91
    function modifyScript(searchText, replacementText) {
        const isRegex = searchText instanceof RegExp;
    
        document.querySelectorAll('script').forEach(script => {
            if (isRegex ? searchText.test(script.innerText) : script.innerText.includes(searchText)) {
                script.remove();
                document.body.appendChild(Object.assign(document.createElement('script'), {
                    text: script.innerText.replace(new RegExp(searchText, 'g'), replacementText)
                }));
            }
        });
    }
    
    const handleShamikcardButtons = (buttonSelector, targetText) => afterDOMLoaded(() => setInterval(() => {
        const button = document.querySelector(buttonSelector);
        if (button && button.textContent.includes(targetText) && !(targetText == 'Get Link')) {
            setTimeout(() => button.click(), 500);
        }
    }, 2000));
    if (/(shramikcard|pmkisanlists|techishant|cinedesi|thevouz).in|cookad.net|(tejtime24|cyberlynews|quizrent).com/.test(url)){
        preventForcedFocusOnWindow();//preventForcedFocusOnWindow not working for this site apparently
        afterWindowLoaded(function() {modifyScript('timeLeft = duration', 'timeLeft = 0')}); // skip timers
        //##Intermediate buttons
        handleShamikcardButtons('#topButton', 'Click to Continue');
        handleShamikcardButtons('#topButton', 'Continue');
        handleShamikcardButtons('#bottomButton', 'Click to Continue');
        handleShamikcardButtons('#bottomButton', 'Continue');
        handleShamikcardButtons('#bottomButton', 'Next'); // added for https://lksfy.com/59EhFF
        //##Final button
        (() => afterDOMLoaded(() => setInterval(() => { const button = document.querySelector('#bottomButton'); if (button && button.textContent.includes('Get Link') && button.style.display === 'block') { setTimeout(() => button.click(), 2000); } }, 1000)))(); //Final button
    }
    /linkshortify.in|lksfy.com/.test(url) ? afterDOMLoaded(function() {
        let intervalId = setInterval(() => {
            const button = document.querySelector('a.get-link');
            if (button && checkCloudflareCaptchaSolved() && !button.classList.contains('disabled')) {
                clearInterval(intervalId);
                button.click();
            }
        }, 1000);
    }) : null;

    // https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-10649981
    // https://greasyfork.org/en/scripts/431691-bypass-all-shortlinks/discussions/263369
    // https://shrinkforearn.xyz/vAs1ikmO - leechpremium.link
    // https://www.reddit.com/r/uBlockOrigin/comments/1g50rur/unable_to_bypass_this_shortlink/
    const clickWithDelay = (selector, delay) => { showAlert('Clicking button in ' + Math.round(delay / 1000) + 's', 'info', delay, '', 'secondary'); setTimeout(function() { clickElementBySelector(selector); }, delay); };
    if (/uqozy.com|posterify.net|drinkspartner.com|manishclasses.in|boiscd.com/.test(url)) {
        afterDOMLoaded(function() {
            modifyScript('timeLeft = duration', 'timeLeft = 0'); // skip timers
            clickWithDelay('#bottomButton', 0);
            clickWithDelay('#open-link', 3000);
        });
    }
    /shrinkforearn.in/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('a.get-link')}) : null;

    // leechpremium.link
    /(ez4short.com|zshort.io)\/[^\/]+\/\?token=[^\/]+$/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#aaoii2o')}) : null;

    // https://droplink.co/4eSowGz4 used by leechpremium.link step 2
    /onlinetntextbooks.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#go_d2');}) : null;

    // starsddl.me
    /starsddl.me\/short\/\?anonym=/.test(url) ? redirect(atob(url.split('?anonym=')[1])) : null;

    // uhdmovies.icu, topmovies.icu (modlist.in), moviesmod.cash
    //uBO filter bypass: https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-11995191
    // button-clicking method
    /(tech|technews).unblockedgames.world/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('span.block > a:nth-child(1)');
        clickIfExists('#verify_button');
        clickIfExists('#verify_button2');
        redirectIfExists('#two_steps_btn');
    }) : null;
    //alt method (thanks to https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-11063787)
    if (/(tech|technews).unblockedgames.world/.test(url)) {
        afterDOMLoaded(function() {
            // First step
            const landingElement = document.querySelector("#landing");
            if (landingElement) {
                landingElement.submit();
            // Second step
            } else {
                // Extract the target URL from the script contents and redirect to it
                const scriptElements = Array.from(document.getElementsByTagName("script"));
                const matchedUrl = scriptElements
                    .map((script) => script.textContent.match(/https:\/\/technews\.unblockedgames\.world\/\?go=pepe-[\w-]+/))
                    .filter((match) => match) // Filter out null values
                    .map((match) => match[0])[0]; // Get the first matching URL

                if (matchedUrl) {
                    window.location.href = matchedUrl;
                }
            }
        });
    }

    // seriezloaded.com.ng
    /seriezloaded.com.ng\/sl-download\/\?link=/ .test(url) ? afterDOMLoaded(function() { redirect(document.querySelector('.sl-button').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1]) }) : null;

    // privatemoviez.homes
    /www.itscybertech.com/.test(url) ? popupsToRedirects() : null;
    /www.itscybertech.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('a.button')}) : null;
    /www.itscybertech.com/.test(url) ? clickIfVisible('#gtbtn2') : null;
    /www.itscybertech.com/.test(url) ? clickIfVisible('.download') : null;
    /thegadgetking.in/.test(url) ? popupsToRedirects() && afterDOMLoaded(function() {clickIfExists('#openbtn')}) : null;

    // Linkvertise
    const solveThroughBypassCity = (linkShortenerUrl) => {if (!/(bypass.city|adbypass.org)/.test(linkShortenerUrl)) {redirect('https://adbypass.org/bypass?bypass=' + encodeURIComponent(linkShortenerUrl))}};
    /* if (/linkvertise.com|(linkvertise|link-to).net/.test(url)) {
        //solve easy case locally
        let rParam = new URLSearchParams(window.location.search).get('r');
        if (rParam) {
            redirect(atob(rParam));
        // solve hard case through bypass.city
        } else {
            solveThroughBypassCity(url);
        }
    } */

    // bstlar.com - not supported by bypass.city anymore
    // // @include     /^(https?:\/\/)(?!(bypass.city|adbypass.org))(bstlar.com)/
    // /bstlar.com/.test(url) ? solveThroughBypassCity(url) : null;

    // empebau.eu used in t.me/barkofleaks
    ///empebau.eu\/s\/linker\/.*/.test(url) ? afterWindowLoaded(function() {
    //    const targetUrl = document.querySelector('#box > p:nth-child(1) > a:nth-child(1)').href;
    //    if (!targetUrl.startsWith('https://empebau.eu')) {redirect(targetUrl)}
    //}) : null;
    /empebau.eu\/s/.test(url) ? afterDOMLoaded(function() {
        redirect(document.documentElement.innerHTML.match(/let url = "(https?:\/\/[^"]+)";/)[1]);
    }) : null;

    // Epicload (seen used in t.me/joinchat/3cfq_APl8Hs4N2Ux)
    /epicload.com\/files/.test(url) ? afterDOMLoaded(function() {
        modifyScript('var timer = 15', 'var timer = 0');
        redirectIfExists('.btn-primary');
        clickIfNotDisabled('.btn-getlink');
    }) : null;

    // mirrorace, doodrive, tested in fluxyrepacks.site
    /woowebtools.com|pallabmobile.in/.test(url) ? afterDOMLoaded(function() {clickIfExistsNonStop('.hv-grid > div:nth-child(2) > div:nth-child(1) > form:nth-child(2) > button:nth-child(2)')}) : null; //continue button
    /woowebtools.com|pallabmobile.in/.test(url) ? afterDOMLoaded(function() {clickIfExistsNonStop('body > div:nth-child(5) > div:nth-child(1) > div:nth-child(1) > p:nth-child(4) > button:nth-child(1)')}) : null; //close anti-adblock banner
    /doodrive.com\/f/.test(url) ? window.addEventListener("load", function(event) {setTimeout(function() { clickIfExists('button.uk-button-primary:nth-child(1)')}, 1000) }) : null; //continue button

    // taodung.com
    /ipamod.com\/redirect-to/.test(url) && url.includes('?s=') ? redirect(decodeURIComponent(url.split('?s=')[1])) : null;

    // 9xflix.business
    /9xflix\.(\w+)\/m\/goto/.test(url) ? redirect(url.split('/goto/')[1]) : null;

    // animeacademy.in
    /highkeyfinance.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#wpsafelinkhuman')}) : null;
    /highkeyfinance.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#wpsafe-link > a:nth-child(1)')}) : null;
    /tech5s.co/.test(url) ? afterDOMLoaded(function() {clickIfExists('#go_d2')}) : null;
    /ez4mods.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#go_d')}) : null;
    /ez4short.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.btn')}) : null;
    /bookszone.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#tp98')}) : null;
    /bookszone.in/.test(url) ? afterDOMLoaded(function() {redirectIfExists('#btn6')}) : null;
    /learnmany.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#tp98')}) : null;
    /learnmany.in/.test(url) ? afterDOMLoaded(function() {redirectIfExists('#btn6')}) : null;
    /yoshare.net/.test(url) ? afterDOMLoaded(function() {clickIfExists('input.btn')}) : null;
    /yoshare.net/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn6')}) : null;
    /reminimod.co/.test(url) ? afterDOMLoaded(function() {clickIfExists('#wpsafe-link > a:nth-child(1)')}) : null;
    /blog.disheye.com/. test(url) ? afterDOMLoaded(function() {clickIfExists('#gourl')}) : null;
    /techrayzer.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#link')}) : null;
    /techrayzer.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn6')}) : null;
    /techrayzer.com\/insurance/. test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn--bg-primary')}) : null;
    /techfizia.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#fizia-btn-after > center:nth-child(1) > a:nth-child(1) > button:nth-child(1)')}) : null;
    /lksfy.in/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.btn')}) : null;
    /droplink.co/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.btn')}) : null;
    /lnks.primarchweb.in/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn--bg-primary')}) : null;

    // gplinks, used in psa.wf sometimes, changes domains daily, use https://greasyfork.org/scripts/490365 instead
/*     if (/mdsuuniversity.org|instander.me|jameen.xyz|dhamakamusic.ink|eternalcbse.i|financialstudy.me|(foreverhealth|newzwala.co|nhmgujarat|jobkijankari|jobwaala|learnwithsaif|lyricsx|smartsetkari|theringtonesworld|recruitmentrasta|mediniweb|pmyojanasarkari|netflixvip|mghindinews|gentletrail|w3hindi|ryzenmusic).in|(anumin|awolio|cgbsesupport|gptproguide|iplquotes|kaisekareblog|minijankari|news36tech|newsloti|odiamusicsong|sugargliderfaqs|picassoappk|geniuseducares|ndlifestylego|raidersixgameapk|sarkariexam365|potter-world|jankari4u|trancebazar|taazaalerts).com/.test(url)) {
        const clickIfVisible2 = (selector) => setInterval(() => { const button = document.querySelector(selector); if (button && button.style.display === 'block') { setTimeout(function() {button.click()}, 500);; clearInterval(intervalId); } }, 1000);
        const clickIfLinkIsReady = buttonSelector => setInterval(() => { const button = document.querySelector(buttonSelector); if (button && button.getAttribute('href') !== '#') setTimeout(function() {button.click()}, 500);; }, 1000);
        afterDOMLoaded(function() {
            count = 0; //Skip the timer
            clickIfVisible2('#VerifyBtn');
            clickIfLinkIsReady('#NextBtn');
        });
    }
    /gplinks.co\/[^/#]+\/(?:#|\?pid=)/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#link-btn > a')}) : null; */

    // toonshub.xyz - https://earnmoneyyt.com/safe.php?link=RNRm2b2H
    /earnmoneyyt.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#tp98')}) : null;
    /earnmoneyyt.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn6')}) : null;
    /earnmoneyyt.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('.tp-blue')}) : null;
    /sheralinks.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;
    /go.bloggingaro.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;
    /land.povathemes.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // https://www.udlinks.com/kzrJRjj - https://publicearn.com/vrpNlNc
    /(bgmiupdatehub|novelquote|superheromaniac|jkssbalerts|taazaloans|spatsify|sikhehindime|careersides).com|(sabarpratham|pubprofit|sarkariyojnaa|reliablesp).in|dear-lottery.org/.test(url) ? afterDOMLoaded(function() {
        window.count = 0;
        clickWithDelay('#tp98', 2000);
        clickWithDelay('#btn6', 2000);
    }) : null;
    /www.udlinks.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // publicearn.com - https://t.me/edutechvn - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/99, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/161
    /thelatintwistcafe.com/.test(url) ? afterDOMLoaded(function() {
        count = 0;
        setTimeout(function() {document.querySelector('#tp98').click();}, 3000);
        setTimeout(function() {document.querySelector('#btn6').click();}, 3000);
        setTimeout(function() {document.querySelector('#.tp-blue').click();}, 3000);
    }) : null;

    // https://rocklinks.in/1ZqZZ2B
    /mobilenagari.com|defencewallah.in/.test(url) ? afterDOMLoaded(function() {
        clickIfExistsNonStop('a.bt-success');
        clickIfExists('#wpsafe-link > a:nth-child(1)');
        clickIfExists('#wpsafelinkhuman');
    }) : null;
    /rocklinks.in/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // https://www.techkhulasha.com/?token=T3VzT - gyanilinks
    /techkhulasha.com|blog.bloggerishyt.in/.test(url) ? afterDOMLoaded(function() {
        modifyScript(/9000|30000|1000/gm, '100');
        clickIfExists('#popup-button');
        clickIfExists('#gotolink');
        clickIfExists('a.bt-success');
        if (document.querySelector('#ad-top > h4:nth-child(2)').innerHTML.includes('step 2')) {clickIfExists('#gotolink')};
    }) : null;
    /golink.bloggerishyt.in/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // gtlinks, used in toonsouthindia.com
    /* /tech.hipsonyc.com|itijobalert.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('.bt-success')}) : null;
    /tech.hipsonyc.com|itijobalert.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#popup-button')}) : null;
    /tech.hipsonyc.com|itijobalert.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#gotolink')}) : null; */
    /tech.itijobalert.in\/\?token\=/.test(url) ? redirect("https://golink.bloggerishyt.in/" + url.split('?token=')[1]) : null;
    /golink.(gyanitheme.com|bloggerishyt.in)/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/10
    // /veganab.co\/\?link=/.test(url) ? redirect('https://za.gl/' + url.split('?link=')[1]) : null;

    // https://greasyfork.org/en/scripts/431691-bypass-all-shortlinks/discussions/165265
    /veganab.co/.test(url) ? popupsToRedirects() : null;
    /veganab.co/.test(url) ? afterDOMLoaded(function() {clickIfExists('button.btn-hover:nth-child(2)')}) : null;
    const extractLinkFromButtonOnclick = buttonElement => buttonElement.getAttribute("onclick").match(/window\.open\('([^']+)'/)[1];
    const redirectToOnclickIfExists = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button) { clearInterval(intervalId); redirect(extractLinkFromButtonOnclick(button)) } }, 500); };
    /camdigest.com/.test(url) ? afterDOMLoaded(function() {redirectToOnclickIfExists('#wpsafe-link > a:nth-child(1) > button:nth-child(1)')}) : null;
    /pastebin.com\/raw/.test(url) ? afterDOMLoaded(function() { const rawContent = document.body.textContent.trim(); isValidUrl(rawContent) ? setTimeout(() => {redirect(rawContent)}, 1500) : null; }) : null; //for firefox, with afterDOMLoaded (must be first)
    /pastebin.com\/raw/.test(url) ? !function() {const rawContent = document.body.textContent.trim(); isValidUrl(rawContent) ? setTimeout(() => {redirect(rawContent)}, 1500) : null; }() : null; //for chrome, without afterDOMLoaded (must be second)

    const clickIfCorrectText = (selector, textContent) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button && button.innerText.includes(textContent) ) { clearInterval(intervalId); setTimeout(() => { button.click();}, 500); }}, 500); };
    /tawda.xyz\/tag/.test(url) ? preventForcedFocusOnWindow() : null;
    /tawda.xyz\/tag/.test(url) ? popupsToRedirects() : null;
    /tawda.xyz\/tag/.test(url) ? afterDOMLoaded(function() {clickIfCorrectText('#continueButton', 'Click to continue')}) : null;

    // rareanimes.net
    /aipebel.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#wpsafelinkhuman')}) : null;
    /aipebel.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#wpsafe-generate > a > img')}) : null;
    /aipebel.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#image3')}) : null;
    /raretoonsindia.rtilinks.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;
    ///(do|fast).rtilinks.com/.test(url) ? window.addEventListener("load", function(event) {redirectIfExists('a[class^="rti_btn"]')}) : null; //dont bypass because it might give streaming option
    ///vidhidepro.com\/d/.test(url) ? afterDOMLoaded(function() {clickIfExists('body > main > div > center > div > div > a > span')}) : null; //maybe shouldnt autoclick this one
    ///vidhidepro.com\/d/.test(url) ? afterDOMLoaded(function() {clickIfExists('#F1 > button > div > div:nth-child(1) > b')}) : null; //maybe shouldnt autoclick this one

    // mirrored.to seen in rareanimes.net
    /www.mirrored.to\/files\/(?!.*\?hash=)/.test(url) ? afterDOMLoaded(function() {redirectIfExists('body > div.container.dl-width > div:nth-child(4) > div > a')}) : null;

    // skyve.io file host, seen on dodi-repacks.site
    const clickIfExistsWithConfirmation = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button) { clearInterval(intervalId); if (confirm('Press OK to download.')) { button.click(); } } }, 500);};
    /skyve.io/.test(url) ? afterDOMLoaded(function() {clickIfExists('#method_free')}) : null;
    // /skyve.io/.test(url) ? afterDOMLoaded(function() {clickIfExistsWithConfirmation('.bicon')}) : null; //download button

    // toonworldtamil.net
    ///(itradercoin|nichapk|easyworldbusiness|riveh).com\/verify\/\?/.test(url) ? redirect('https://blog.filepresident.com/' + url.split('/?')[1]) : null; doesnt work, the site doesnt let you get directly to that URL
    if (/(itradercoin|nichapk|easyworldbusiness|riveh).com/.test(url)) {
        const redirectIfVisible = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button && !button.getAttribute('style').includes('display:none')) { clearInterval(intervalId); redirect(button.href) } }, 500); };
        const redirectIfVisible2 = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button && button.getAttribute('style').includes('block')) { clearInterval(intervalId); redirect(button.querySelector('a').href) } }, 500); };
        afterDOMLoaded(function() {
            redirectIfVisible('#yuidea-btn-after'); //Step 1
            count = 0; // skip timer
            redirectIfVisible2('#yuidea-snp'); // Steps 2-3
        });}
    /blog.filepresident.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('a.btn')}) : null;

    // mkvmoviespoint.casa
    /mkvmoviespoint.casa\/goto/.test(url) ? afterDOMLoaded(function() {redirectIfExists('body > div:nth-child(7) > a:nth-child(1)')}) : null;
    /w.linkspoint.net/.test(url) ? afterDOMLoaded(function() {clickIfExists('.btnx')}) : null;

    // moviehunt.us
    /gdslink.xyz/.test(url) ? afterDOMLoaded(function() {redirect(document.querySelector('.main-wrap > form:nth-child(2) > input:nth-child(1)').value)}) : null;

    // link.tnshort.net - https://github.com/FastForwardTeam/FastForward/issues/1368
    /financeyogi.net/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn5')}) : null;
    /financeyogi.net/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn2')}) : null;
    /jrlinks.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn1')}) : null;
    /jrlinks.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn2')}) : null;
    /go.tnshort.net/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;

    // 4fnet.org - https://github.com/FastForwardTeam/FastForward/issues/1298
    /www.4fnet.org\/goto/.test(url) ? redirect(atob(url.split('/goto/')[1])) : null;

    // linkmo.net / adpayl.ink - https://github.com/FastForwardTeam/FastForward/issues/1291 / https://github.com/FastForwardTeam/FastForward/issues/1290
    /(linkmo.net|adpayl.ink)\/[^?]+\?data=.+$/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;

    // musicc.xyz - https://github.com/FastForwardTeam/FastForward/issues/1234 (note: this one is already bypassed by the original script, because it runs on every domain. It was just necessary to let the script run on this domain)
    /musicc.xyz/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;

    // zshort.net, shotzon.com - jnovels.com - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/5, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/59
    function checkRecaptchaSolved() { return window.grecaptcha && window.grecaptcha.getResponse().length !== 0; }
    const clickIfRecaptchaSolved = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (window.grecaptcha.getResponse().length !== 0) { clearInterval(intervalId); button.click(); } }, 1000); };
    /cloutgist.com/.test(url) ? afterWindowLoaded(function() {clickIfRecaptchaSolved('.btn-captcha');}) : null;
    /(cravesandflames|codesnse|cloutgist).com/.test(url) ? afterDOMLoaded(function() {clickIfExists('button.btn:nth-child(1)')}) : null;
    /go.(cravesandflames|codesnse|cloutgist).com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // olamovies.rent - https://v2links.me/q1z4ssolam //add stuff missing from the main script
    /v2links.(com|me)/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;
    /(newsbawa|utkarshonlinetest|techbezzie|financewada).com/.test(url) ? afterDOMLoaded(function() {
        time = 0;
        clickIfExists('.start_btn');
        setTimeout(function() {clickIfExists('div.step_box.get_btn div.btn')}, 2000);
        clickIfExists('a.btn');
    }) : null;
    /wp2host.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('button.btn')}) : null;

    // olamovies.rent - https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-9904041
    /ielts-isa.edu.vn/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('#monetiza');
        clickIfExists('button.yu-btn:nth-child(1)');
        clickIfExists('#btn6');
    }) : null;
    

    // psa.wf, olamovies.bar, https://ez4short.com/ar02kkolam - (adding here stuff missing from the main script)
    ///tiktokcounter.net/.test(url) ? preventForcedFocusOnWindow() : null;
    // /antonimos.de|tiktokcounter.net|tiktokrealtime.com|tpayr.xyz|quesignifi.ca|lifgam.online|waezf.xyz|ashrfd.xyz/.test(url) ? setInterval(function(){window.wT9882=0;},1000) : null;
    // /tiktokcounter.net/.test(url) ? afterDOMLoaded(function() {wT9982 = 0;}) : null; //Skip the timer
    // const clickTikTokCounterButtons = () => { let buttonSelector = 'button#cbt.btn.btn-warningbtn.btn-primary'; let intervalId = setInterval(() => { let button = document.querySelector(buttonSelector); if (!button.hasAttribute('disabled') && button.innerHTML.includes('Continue')) { clearInterval(intervalId); isHoverDone = true; setTimeout(function() { button.click();}, 500) } }, 500); };
    // /tiktokcounter.net/.test(url) ? afterDOMLoaded(function() {clickTikTokCounterButtons()}) : null;

    // psa.wf
    /10short.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('.btn')}) : null;
    /zegtrends.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('.bsub')}) : null;
    /zegtrends.com/.test(url) ? afterDOMLoaded(function() {clickIfExists('#go1')}) : null;
    /icutlink.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;
    /motakhokhara.blogspot.com/.test(url) ? afterDOMLoaded(function() {clickIfExistsNonStop('a.safeb')}) : null;
    /motakhokhara.blogspot.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#safesub')}) : null;
    /xpshort.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.btn')}) : null;
    /jobzspk.xyz/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn1')}) : null;
    /jobzspk.xyz/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn2')}) : null;
    /jobzspk.xyz/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn4')}) : null;
    /jobzspk.xyz/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn5')}) : null;
    /urls.cx/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('.video-button')}) : null;

    // filmesmega.online
    /minimilionario.com\/noticia.php\?token=/.test(url) ? redirect(atob(url.split('?token=')[1])) : null;

    // ontorrent.org
    /usandoapp.com/.test(url) ? afterDOMLoaded(function() {redirectIfExists('.DownloadButOn')}) : null;

    // web1s - examples:  (nsfw) https://github.com/AdguardTeam/AdguardFilters/issues/154319 / https://t.me/s/cosplaydistrict / https://discord.com/invite/mtMGnm9aTd
    /web1s.asia\/api-mode/.test(url) ? afterDOMLoaded(function() {clickIfExists('#submit')}) : null;
    /web1s.asia\/api-mode/.test(url) ? afterDOMLoaded(function() {clickIfExists('#submit-button')}) : null;
    // asideway sub-link-shortener. example: https://asideway.com/normal/j5GLNIDiHq/
    /asideway.com/.test(url) ? afterWindowLoaded(function() {count = 0;}) : null;
    const clickIfVisible4 = (selector, textContent) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (button && button.style.display.includes('block') && button.innerText.includes(textContent) && !button.hasAttribute('disabled') ) { clearInterval(intervalId); setTimeout(() => { button.click();}, 500); }}, 500); };
    /asideway.com/.test(url) ? afterWindowLoaded(function() {clickIfVisible4('#link1s', '1/2')}) : null;
    /asideway.com/.test(url) ? afterWindowLoaded(function() {clickIfVisible4('#link1s', '2/2')}) : null;
    // linkvip.io blitly.io sub-link-shortener. example: https://linkvip.io/redirect?api=9VAupEozzdsn3k6tMTcLWL4DJ&url=https://drive.google.com/drive/folders/1vvSM0OXgnZTcALJeThAkIRxzRBRsBGjm?usp=sharing
    /(linkvip|blitly).io/.test(url) ? url.includes('url=') ? redirect(new URL(url).searchParams.get('url')) : null : null;

    // megalink.pro - https://greasyfork.org/en/scripts/431691-bypass-all-shortlinks/discussions/235270 - https://megalink.pro/pD6wK (nsfw)
    /megalink.pro\/[a-zA-Z0-9]+$/.test(url) ? afterWindowLoaded(function() {setTimeout(function() {clickIfNotDisabled('a.btn:nth-child(1)')}, 3000)}) : null;

    // pahe.ink
    /* /linegee.net|intercelestial.com|teknoasian.com/.test(url) ? preventForcedFocusOnWindow() : null;
    function isWeirdButton(button) {
        const suspiciousStyles = ['position: absolute;left: 99999px;'];
        const suspiciousWords = ['patch'];

        // Check for suspicious styles
        const style = button.getAttribute('style');
        if (style && suspiciousStyles.some(s => style.includes(s))) {
            return true;
        }

        // Check for suspicious words in text content
        const textContent = button.textContent.toLowerCase();
        if (suspiciousWords.some(word => textContent.includes(word))) {
            return true;
        }

        return false;
    }
    /teknoasian.com/.test(url) ? afterDOMLoaded(function() {
        let intervalId = setInterval(() => {
            let buttons = document.querySelectorAll('button.verify, button.skipcontent, button.postnext');
            for (let button of buttons) {
                let buttonIsVisible = button && button.offsetParent !== null;
                if (buttonIsVisible && !isWeirdButton(button)) {
                    button.click();
                    if (button.classList.contains('postnext')) {
                        clearInterval(intervalId);
                    }
                }
            }
        }, 1000);
    }) : null; */

    //pahe.ink final step
    /linegee.net/.test(url) ? afterDOMLoaded(function() {
        const scripts = document.getElementsByTagName('script');
        for (let script of scripts) {
            const content = script.innerHTML;
            const match = content.match(/location\.href\s*=\s*atob\('([^']+)'\);/);
            if (match) {
                setTimeout(() => {
                    redirect(window.location.href + atob(match[1]));
                }, 3000);
                break;
            }
        }
    }) : null;

    /pahe.plus/.test(url) ? afterDOMLoaded(function() {
        clickIfNotDisabled('#invisibleCaptchaShortlink');
        redirectIfNotDisabled('a.get-link');
    }) : null;

    /old.pahe.plus/.test(url) ? afterDOMLoaded(function() {clickIfExists('a.btn:nth-child(1)')}) : null;

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/94
    /pahe.win/.test(url) ? afterWindowLoaded(function() {setTimeout(function() {redirectIfExists('.redirect');}, 6000);}) : null;

    // spaste.com use in pahe.ink - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/77
    function checkHCaptchaSolved() {
        if (document.querySelector('.h-captcha')) {
            return window.hcaptcha.getResponse().length !== 0;
        }
        return true;
    }
    function clickIfHCaptchaSolved(selector) {
        let intervalId = setInterval(() => {
            if (checkHCaptchaSolved()) {
                clearInterval(intervalId);
                document.querySelector(selector).click();
            }
        }, 1000);
    }
    /www.spaste.com\/site\/checkPasteUrl\?c=/.test(url) ? afterDOMLoaded(function() {
        clickIfHCaptchaSolved('#template-contactform-submit');
    } ) : null;
    /www.spaste.com\/p\?c=/.test(url) ? afterDOMLoaded(function() {
        redirectIfExists('#template-contactform-message > a:nth-child(3)');
    }) : null;

    // https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-8884375
    if (/4hi.in/.test(url)) { afterDOMLoaded(function() {
        clickIfExists('.btn-warning:not(.btn-captcha)');
        clickIfNotDisabled('#invisibleCaptchaShortlink');
        redirectIfNotDisabled('a.get-link'); })}

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/12
    /lnk.news/.test(url) ? afterDOMLoaded(function() {clickIfExists('#csubmit')}) : null;

    // https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-8893133
    const afterElementVisible = (selector, callback) => {let intervalId = setInterval(() => {let element = document.querySelector(selector);if (element && (element.style.display.includes('block') || !element.style.display.includes('none'))) {clearInterval(intervalId);callback();}}, 500);};
    /imagereviser.com/.test(url)  ? preventForcedFocusOnWindow() : null;
    /imagereviser.com/.test(url)  ? afterDOMLoaded(function() {afterElementVisible('#second_btn_div', function() {document.querySelector('#bottom_btn').click();}) }) : null;
    /upshrink.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // comandofilmeshd.org
    /bangclinic.life/.test(url) ? afterDOMLoaded(function() {redirectIfExists('a.DownloadButOn')}) : null;

    // ofilmetorrent.com
    /dow-dow-dow-dow-dow.xyz\/download\/\?id=/.test(url) ? redirect(atob(url.split('?id=')[1].split('&')[0])) : null;
    /ofilmetorrent.com\/download\/\?id=/.test(url) ? afterDOMLoaded(function() {
        document.querySelectorAll('a[href*="https://dow-dow-dow-dow-dow.xyz/download?id="]').forEach(link => {
            link.href = atob(link.getAttribute('href').split('?id=')[1].split('&')[0]);
        }); }) : null;

    // librospdfgratismundo.net
    /librospdfgratismundo.net/.test(url) ? afterDOMLoaded(function() {
        document.querySelectorAll('a[href*="https://librospdfgratismundo.net/rt?url="]').forEach(link => {
            link.href = atob(link.getAttribute('href').split('?url=')[1]);
        }); }) : null;

    // animesgd.net
    /animesgd.net/.test(url) ? afterWindowLoaded(function() {
        document.querySelectorAll('a[href*="https://domk5.net/redir3/?"]').forEach(link => {
            link.href = link.getAttribute('href').split('/redir3/?')[1];
        }); }) : null;

    if (/animesgd.net\/out\/\?/.test(url)) { 
        const decodedUrl = atob(url.split('/out/?')[1]);
        if (decodedUrl.includes('url=')) {redirect(decodedUrl.split('url=')[1])}
        if (decodedUrl.includes('redir3/?')) {redirect(decodedUrl.split('/redir3/?')[1])}
    }

    // platinsport.com
    /platinsport.com/.test(url) ? afterDOMLoaded(function() {
        document.querySelectorAll('a[href*="http://bc.vc/"]').forEach(link => {
            link.href = 'https://' + link.getAttribute('href').split('/https://')[1];
        }); }) : null;

    //fiuxy2.co
    /fiuxy2.co\/threads/.test(url) ? afterWindowLoaded(function() {
        document.querySelectorAll('a[href*="mega-enlace.com/ext.php?o="]').forEach(function(element) {
            if (isValidUrl(element.innerText)) { element.href = element.innerText;};
            // element.href = rot13(atob(rot13(atob(element.href.split('?o=')[1])))).split('|')[0];
        }); }) : null;

    // ocultandoo (used in fiuxy2.co)
    /ocultandoo.blogspot.com/.test(url) ? afterDOMLoaded(function() {clickIfExistsNonStop('#getlink')}) : null;
    /ocultandoo.blogspot.com/.test(url) ? afterDOMLoaded(function() {clickIfExistsNonStop('#gotolink')}) : null;

    // toonhub4u.net
    /toonhub4u.net\/redirect\/main.php\?url=/.test(url) ? redirect(atob(url.split('url=')[1])) : null;
    /toonhub4u\.net\/([^\/]+)\/$/.test(url) ? afterWindowLoaded(function() {
        document.querySelectorAll('a[href*="https://toonhub4u.net/redirect/main.php?url="]').forEach(link => {
            link.href = atob(link.getAttribute('href').split('?url=')[1]);
        }); }) : null;

    // megalinks (used in peliculasmega1k.com)
    /megalinks.info\/index.php\?v=/.test(url) ? clickIfExists('#continue') : null;

    // doroni.me - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/24
    if (/rodimalam.com/.test(url)) { afterDOMLoaded(function() {
        clickIfExistsNonStop('#SafelinkChecker');
        let intervalId = setInterval(function() {
            let targetLink = document.querySelector('a[href*="https://semawur.com/st/?api="]');
            if (targetLink) { clearInterval(intervalId); redirect(decodeURIComponent(targetLink.href.split('url=')[1])); }; }, 1000);
        }); }

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/32
    /short-url.link\/[^\/]+$/.test(url) ? afterDOMLoaded(function() {redirectIfExists('a.go-to-button')}) : null;

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/34
    const redirectIfNotDisabled2 = (selector) => { let intervalId = setInterval(() => { let linkButton = document.querySelector(selector + ':not(.disabled)'); if (linkButton && !linkButton.href.includes('/undefined') && isValidUrl(linkButton.href)) { clearInterval(intervalId); setTimeout(function() {redirect(linkButton.href);}, 500) } }, 500); };
    if (/urlx.one\/[^\/]+$/.test(url)) { afterDOMLoaded(function() {
        redirectIfNotDisabled2('a.get-link');
        const overlay = Object.assign(document.createElement('div'), {style: 'position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.7); color: #fff; font-family: Arial, sans-serif; font-size: 44px; text-align: center; padding-top: 50%;', innerText: 'Bypassing... Wait ~5s'});
        document.body.appendChild(overlay);
    }) }

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/36
    /trimorspacks.com|pastescript.com|updrop.link/.test(url) ? afterDOMLoaded(function() {redirectIfExists('#wpsafe-link > a:nth-child(1)')}) : null;

    // sinsitio.site / dixva.com
    if (/www.(sinsitio.site|dixva.com)\/code\/\?go=/.test(url)) {
        const decode = (encodedString) => {
            const dictionary = {'0': 'z', '1': 'y', '2': 'x', '3': 'w', '4': 'v', '5': 'u', '6': 't', '7': 's', '8': 'r', '9': 'q', 'A': 'p', 'a': 'P', 'B': 'o', 'b': 'O', 'C': 'n', 'c': 'N', 'D': 'm', 'd': 'M', 'E': 'l', 'e': 'L', 'F': 'k', 'f': 'K', 'G': 'j', 'g': 'J', 'H': 'i', 'h': 'I', 'I': 'h', 'i': 'H', 'J': 'g', 'j': 'G', 'K': 'f', 'k': 'F', 'L': 'e', 'l': 'E', 'M': 'd', 'm': 'D', 'N': 'c', 'n': 'C', 'O': 'b', 'o': 'B', 'P': 'a', 'p': 'A', 'q': '9', 'Q': 'Z', 'r': '8', 'R': 'Y', 's': '7', 'S': 'X', 't': '6', 'T': 'W', 'u': '5', 'U': 'V', 'v': '4', 'V': 'U', 'w': '3', 'W': 'T', 'x': '2', 'X': 'S', 'y': '1', 'Y': 'R', 'z': '0', 'Z': 'Q'};
            return encodedString.split('').map(char => dictionary[char] || char).join('');
        }
        redirect(decode(atob(url.split('?go=')[1])));
    }
    /www.yitarx.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    // https://thotpacks.xyz/R7p2l
    /thotpacks.xyz/.test(url) ? afterDOMLoaded(function() {
        //clickIfAllCaptchasSolved('#invisibleCaptchaShortlink');
        //clickIfRecaptchaSolved('#invisibleCaptchaShortlink');
        clickIfExists('#invisibleCaptchaShortlink');
        redirectIfNotDisabled('a.get-link');
    }) : null;

    // linkpays.in - t.me/canvapro365free - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/88, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/48
    function clickAnyVisibleButtonNonStop(interval){
        let intervalId = setInterval(() => {
            const buttons = document.querySelectorAll('button'); //, input[type="button"], input[type="submit"]:focus-visible');
            buttons.forEach(function(button) {if (button.offsetParent !== null) {clickElement(button);}});
        }, interval);
    }
    // /(surfsees.com|techyblogs.in)\/safe.php\?link=/.test(url) ? redirect('https://pokoarcade.com/token.php?id=' + url.split('link=')[1]) : null;
    /((surfsees|travelagancy|venzoars|webbooki|pokoarcade|edigitalizes|finquizy).com|(fitnessholic|myindigocard).net|stockinsights.in|pandagamepad.co|techsl.online)(?!.*(safe\.php\?link=|&__cf_chl_tk=))/.test(url) && !url.includes('token.php') ? afterWindowLoaded(function() {
        clickAnyVisibleButtonNonStop(2000);
    }) : null;
    // /(cryptings.in|vbnmx.online)(?!.*(safe\.php\?link=|&__cf_chl_tk=))/.test(url) ? afterDOMLoaded(function() {redirectIfExists('#rtg-btn > a:nth-child(1)')}) : null;
    // /(cgsonglyricz.in|www.techhubcap.com)(?!.*(safe\.php\?link=|&__cf_chl_tk=))/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn6')}) : null;
    // /(techyblogs.in|readytechflip.com)(?!.*(safe\.php\?link=|&__cf_chl_tk=))/.test(url) ? afterWindowLoaded(function() {clickIfNotDisabled('#tp-snp2')}) : null;

    // stfly - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/62
    function checkCloudflareCaptchaSolved() {
        if (document.querySelector('.cf-turnstile') || document.querySelector('#captcha-turnstile')) {
            return window.turnstile.getResponse().length !== 0;
        }
        return true;
    }
    function checkGoogleRecaptchaSolved() {
        if (document.querySelector('.g-recaptcha') || document.querySelector('#captchaShortlink') || document.querySelector('#captcha_container') || document.querySelector('#captchaShortlinker')) {
            return window.grecaptcha.getResponse().length !== 0;
        }
        return true;
    }
    if (/stfly.(cc|xyz|biz|me)|stly.link|(techtrendmakers|gadnest|optimizepics|bookbucketlyst).com|(blogbux|blogesque|exploreera|explorosity|trekcheck|torovalley|travize|metoza|techlike|crenue|atravan|transoa|techmize|snaplessons|airevue).net/.test(url)) {
        preventForcedFocusOnWindow();
        
        function clickAllValidButtons() {

            function clickAvailableButtons(buttonTexts) {
                let buttons = document.querySelectorAll('button, input[type="button"], input[type="submit"]:focus-visible');
                buttons.forEach(function(button) {if (buttonTexts.includes(button.textContent.trim())) {clickElement(button);}});
            }

            //Different actions depending on current step
            let currentStep = document.querySelector('span.text-center').innerText.trim();
            let buttonTexts = [];
            if (currentStep.includes('step 1')) {
                buttonTexts = ['Click here to proceed'];
                clickAvailableButtons(buttonTexts);
            } else if (currentStep.includes('step 2')) {
                buttonTexts = ['Click here to start', 'Start', 'Begin', 'Open'];
                clickAvailableButtons(buttonTexts);
                if (checkGoogleRecaptchaSolved() && checkCloudflareCaptchaSolved()) {
                    buttonTexts = ['Verify', 'Click here to verify'];
                    clickAvailableButtons(buttonTexts);
                    setTimeout(function() {
                        buttonTexts = ['Next Post', 'Next step', 'Get to next step', 'Go next', 'Continue'];
                      clickAvailableButtons(buttonTexts);
                    }, 2000);
                }
            } else if (currentStep.includes('step 3')) {
                if (document.querySelector('.progress-done').innerHTML.trim() === '0%'){
                    buttonTexts = ['Click here to start', 'Start','Begin', 'Open'];
                    clickAvailableButtons(buttonTexts);
                } else if (document.querySelector('.progress-done').style.width === '100%'){
                    buttonTexts = ['Verify', 'Click here to verify'];
                    clickAvailableButtons(buttonTexts);
                    setTimeout(function() {
                        buttonTexts = ['Next Post', 'Next step', 'Get to next step', 'Go next', 'Continue'];
                        clickAvailableButtons(buttonTexts);
                    }, 2000);
                }
            } else if (currentStep.includes('step 4')) {
                buttonTexts = ['Open', 'Start', 'Begin', 'Click here to start'];
                clickAvailableButtons(buttonTexts);
                setTimeout(function() {
                    buttonTexts = ['Click here to verify', 'Verify', 'Please wait..', 'Loading..'];
                    clickAvailableButtons(buttonTexts);
                    setTimeout(function() {
                        buttonTexts = ['Next Post', 'Next step', 'Get to next step', 'Go next', 'Continue'];
                        clickAvailableButtons(buttonTexts);
                    }, 2000);
                }, 8000)
            } else if (currentStep.includes('step 5')) {
                buttonTexts = ['Open', 'Start', 'Begin', 'Click here to start'];
                clickAvailableButtons(buttonTexts);
                setTimeout(function() {
                    buttonTexts = ['Click here to verify', 'Verify', 'Please wait..', 'Loading..'];
                    clickAvailableButtons(buttonTexts);
                }, 8000)
            }

        }

        window.addEventListener('load', function() {clickAllValidButtons();}); //Click all the valid buttons when the page loads
        setInterval(function() {clickAllValidButtons();}, 2000); //Click all the valid buttons every 2 seconds
    }

    // uploadrar - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/87
    /flash.getpczone.com/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('#downloadbtn')}) : null;

    // zipshort.net - https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-9971779
    /ontechhindi.com/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('#rtg > center:nth-child(2) > button:nth-child(1)');
        clickIfExists('div.code-block:nth-child(4) > center:nth-child(1) > div:nth-child(2) > a:nth-child(1) > button:nth-child(1)');
    }) : null;

    // vnshortener.com (pxanimeurdu.com) - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/110, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/149
    function clickIfVisible3(selector) {
        let intervalId = setInterval(() => {
            let button = document.querySelector(selector);
            if (button && button.offsetParent !== null) {
                clearInterval(intervalId);
                clickElement(button);
            }
        }, 1000);
    }
    /kbconlinegame.com/.test(url) ? afterDOMLoaded(function() {
        clickIfVisible3('#pro-continue');
        setTimeout(function() {
            clickIfVisible3('#pro-btn');
        }, 2000);
    }) : null;
    /owoanime.com/.test(url) ? afterWindowLoaded(function() {
        window.countdown = 0;
        showPopup();
        clickIfVisible3('#pro-continue');
        clickIfVisible3('#pro-btn');
    }) : null;
    /importantclass.com/.test(url) ? afterDOMLoaded(function() {
        window.countdown = 0;
        showPopup();
        clickIfVisible3('#my-btn');
        clickIfVisible3('#my-btn2');
    }) : null;
    /keedabankingnews.com/.test(url) ? afterWindowLoaded(function() {
        window.count = 0;
        clickIfExists('#tp-snp2');
    }) : null;


    // pxanimeurdu.com
    function setCookie(name, value) {
        document.cookie = name + "=" + value + "; path=/";
    }
    function getCookie(name) {
        var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
        return match ? match[2] : null;
    }
    if (/pxanimeurdu.com/.test(url)){
        let pxcheckValue = getCookie("pxcheck");
        if (!pxcheckValue) {
            setCookie("pxcheck", "aTBvaGg4a1dFMzNwcUM1aWtTaVprUT09");
        }
    }
    /pxanimeurdu.com\/redirect\/main.php\?url=/.test(url) ? afterDOMLoaded(function() {
        redirectIfExists('.px-effect-btn');
    }) : null;


    // inshorturl.com - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/104, https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/212, https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-10744404
    /(newshuta|5ghindi|gujaratalert|mahitimanch|gujmitra).in|(indiamaja|thespotifypremium).com|mtmanagers.pro/.test(url) ? afterDOMLoaded(function() {
        window.count = 0;
        clickIfExists('#tp98');
        clickIfExists('#btn6');
        clickIfNotDisabled('#gtelinkbtn');
    }) : null;

    // hyp.sh - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/101 - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/158 - https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-12198432
    /hypershort.com/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('#generatelink');
        redirectIfExists('#gettinglink');
    }) : null;

    // render-state.to - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/108
    /render-state.to\/download\/\?link=/.test(url) ? afterDOMLoaded(function() {
        //if (document.querySelector('#megkey')) {alert(document.querySelector('#megkey').innerText + '\n' + document.getElementById('deckey').value);};
        if (!document.querySelector('#megkey')) {
            popupsToRedirects();
            goToLink();
        }
    }) : null;

    // pelismkvhd.com
    /www.lanoticia.cc/.test(url) ? afterDOMLoaded(function() {
        clickIfNotDisabled('#invisibleCaptchaShortlink');
        redirectIfNotDisabled('a.get-link');
    }) : null;

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/168
    /mastramstories.com\/api.php\?api/.test(url) ? redirect(atob(url.split('?api=')[1])) : null;
    /links.kmhd.net\/file/.test(url) ? afterDOMLoaded(function() {clickIfExists('button.inline-flex');}) : null;
    // katmoviehd.wales
    /links.kmhd.net\/locked\?redirect=/.test(url) ? afterDOMLoaded(function() {clickIfExists('button.inline-flex');}) : null;

    // olamovies link generator
    /app2.olamovies.download\/generate\/\?id=/.test(url) ? afterDOMLoaded(function() {clickIfExists('button.inline-flex');}) : null;

    // saferoms.com
    /www.saferoms.com\/\?go=/.test(url) ? afterDOMLoaded(function() {
        let dlLink = document.querySelector('#wpsafe-link > a:nth-child(1)').href;
        dlLink = decodeURIComponent(atob(dlLink.split('safelink_redirect=')[1]));
        dlLink = dlLink.match(/"safelink":"(.*?)"/)[1];
        if (confirm(`Confirm to redirect to \n${dlLink.split('https://href.li/?')[1]}\n`)) {redirect(dlLink);}
    }) : null;

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/170
    /hdpastes.com\/\?v=/.test(url) ? afterDOMLoaded(function() {clickIfRecaptchaSolved('.btn-success');}) : null;

    // shrtbr.com/aaNEJEXp - t.me/xred2 - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/122
    /encurtads.net|financacerta.com/.test(url) ? afterDOMLoaded(function() {
        //redirect(atob(document.querySelector('#wpsafe-link > a:nth-child(1)').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"second_safelink_url":"(.*?)"/)[1]);
        //redirect(atob(document.querySelector('#wpsafe-link > a:nth-child(1)').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1]);
        clickIfExists('#wpsafe-link > a:nth-child(1) > button:nth-child(1)');
    }) : null;
    /shrtbr.com/.test(url) ? afterDOMLoaded(function() {redirectIfExists('a.get-link.btn.btn-lg.btn-success:not(.disabled):not(div.banner:nth-child(4) > div:nth-child(1) > a:nth-child(1))');}) : null;

    // https://f.technicalatg.in/6iTpuM1 - https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-10954732
    /skillheadlines.in/.test(url) ? afterDOMLoaded(function() { redirect(atob(document.querySelector('#wpsafe-link > a:nth-child(1)').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1]);}) : null;

    // https://delpez.com/?go=1ad8bb46 - https://t.me/heroelink - https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-10954732
    /delpez.com/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('.btn-primary');
        redirect(decodeURIComponent(atob(document.querySelector('#wpsafe-link > a:nth-child(1)').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1]));
    }) : null;

    // https://github.com/FastForwardTeam/FastForward/issues/1515
    /mendationforc.info/.test(url) ? redirect(decodeURIComponent(atob(url.split('&cc=')[1]).match(/"link":"(.*?)"/)[1]) ) : null;

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/184
    /click.convertkit-mail.com/.test(url) ? redirect(atob(url.match(/.*(aHR0.*)/)[1])) : null;

    // relampagomovies.com
    if (/^https:\/\/relampagomovies\.com\/.+/.test(url)) {
        afterWindowLoaded(function() {
            clickIfExists('#countdown > a:nth-child(1)');
            clickIfExists('#dllink');
            redirectIfExists('div.content2 a');
            redirectIfExists('a[href*="filemoon.sx"]');
        });
    }

    // https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/224
    /tii.la|oei.la|iir.la|tvi.la|oii.la|tpi.li|lnbz.la/.test(url) ? afterDOMLoaded(function() {
        const regex = /aHR0c[^"]+/g;
        const matches = document.documentElement.innerHTML.match(regex);
        if (matches && matches.length > 0) {
          const decodedUrl = atob(matches[0]);
          redirect(decodedUrl);
        }
    }) : null;

    // https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-11280464
    /tii.la|oei.la|iir.la|tvi.la|oii.la|tpi.li|lnbz.la/.test(url) ? afterWindowLoaded(function() {
        const form = document.querySelector('#link-view > form');
        if (form) {
            form.action = document.querySelector('#link-view > form > input[name=url]').value;
        }
    }) : null;

    // modijiurl - https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-11295970
    function browserIsFirefox() {return navigator.userAgent.toLowerCase().indexOf('firefox') > -1;}
    // /^https:\/\/[^\/]+\/safe\.php\?link=https:\/\/modijiurl\.com\/[^\/]+\/\?mid=.*$/.test(url) && browserIsFirefox() ? redirect(url.split('?link=')[1]) : null;
    // /^https:\/\/modijiurl\.com\/[^\/]+\/\?mid=.*$/.test(url) ? redirectIfNotDisabled('#getLinkButton') : null;

    // sittingonclouds.com .net
    /paster.gg/.test(url) ? redirect(decodeURIComponent(url.split('&link=')[1].split('&')[0])) : null;

    // dodi-repacks.site
    /go.zovo.ink/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('button.btn:nth-child(4)');
        redirectIfNotDisabled('a.get-link');
    }) : null;

    // kisalt - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/213
    /kisalt.com\/.*/.test(url) ? afterDOMLoaded(function() {clickIfExists('.btn.btn-primary');}) : null;

    // Anylinks.in .site - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/220
    if (/((ukrupdate|mastkhabre).com|aryx.xyz)/.test(window.location.href)) {
        let delay = 12000;
        if (/aryx.xyz/.test(window.location.href)) delay = 1000;
        window.addEventListener('load', function() {
            setTimeout(() => document.getElementById('btn6').click(), delay);
        });
    }

    // go.paid4link.com 3rd step
    function getURLwithSafelinkFromThePageScripts() {
        const scripts = document.getElementsByTagName('script');
        for (let script of scripts) {
            const content = script.innerHTML;
            // we try to match any URL that contains "safelink" and is from the same domain
            const matches = content.match(/(https?:\/\/[^'"]+safelink[^'"]+)/g);
            if (matches) {
                for (let match of matches) {
                    if (match.includes(window.location.hostname)) {
                        return match;
                    }
                }
            }
        }
    }
    /(aduzz|tutorialsaya|indobo|baristakesehatan|merekrut).com|deltabtc.xyz|bit4me.info/.test(url) ? afterDOMLoaded(function() {
        const url = getURLwithSafelinkFromThePageScripts();
        if (url) redirect(url);
    }) : null;

    // go.paid4link.com last step - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/222
    //const redirectIfCloudflareCaptchaSolved = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (checkCloudflareCaptchaSolved()) { clearInterval(intervalId); redirect(button.href); } }, 1000); };
    /link.paid4link.com/.test(url) ? afterDOMLoaded(function() { redirectIfExists('#get-link-button');}) : null;

    // adsafelink / link2unlock - https://github.com/realodix/AdBlockID/issues/1874
    const clickIfCloudflareCaptchaSolved = (selector) => { let intervalId = setInterval(() => { let button = document.querySelector(selector); if (checkCloudflareCaptchaSolved()) { clearInterval(intervalId); button.click(); } }, 1000); };
    /app.link2unlock.com/.test(url) ? afterDOMLoaded(function() { 
        clickIfExists('#btn-1');
        clickIfExists('#btn-2');
        clickIfCloudflareCaptchaSolved('#btn-3');
        clickIfExists('#submit-button');
    }) : null;

    // pandaznetwork - https://t.me/hubcloud_movies, https://t.me/latest_movies_2025_1
    /freemodsapp.in/.test(url) ? popupsToRedirects() : null;
    /freemodsapp.in/.test(url) ? afterDOMLoaded(function() {clickIfExists('#btn6')}) : null;
    /pandaznetwork.com/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link')}) : null;

    //suncy.net (upfiles.com) (seen used in fiuxy2.co)
    /sunci.net/.test(url) ? afterDOMLoaded(function() {clickIfNotDisabled('button#link-button.btn-primary:not(.btn-download)')}) : null;

    // upfiles.app
    /(upfiles.app|haxi.online|upfion.com)\/[^\/]+/.test(url) ? afterDOMLoaded(function() {
        clickIfCorrectText('#link-button', 'Continue');
        clickIfRecaptchaSolved('#link-button');
        redirectIfNotDisabled('a#link-button');
    }) : null;

    // datanodes - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/140
    /datanodes.to\/download/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('#method_free')
        clickIfCorrectText('button.py-3', 'Download')
        //setTimeout(function() {clickIfCorrectText('button.py-3', 'Continue')}, 6000)
    }) : null;

    // dailyuploads - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/123
    /dailyuploads.net\/[^\/]+/.test(url) ? afterDOMLoaded(function() {
        clickIfRecaptchaSolved('#downloadbtn');
        //redirectIfExists('a#fbtn1');
    }) : null;

    // ryuugames
    /www.ryuugames.com\/\?eroge=.*$/.test(url) ? afterDOMLoaded(function() {
        redirect(atob(document.querySelector('#wpsafe-link > a:nth-child(1)').href.split('?safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1]);
    }) : null;
    /anchoreth.com\/r-adsh\?t=i&v=.*$/.test(url) ? redirect(atob(url.split('&v=')[1].split('&')[0])) : null;

    // mixrootmod
    /mixrootmod.com/.test(url) ? afterDOMLoaded(function() {
        redirect(decodeURIComponent(atob(document.querySelector('#wpsafe-link > a').getAttribute('onclick').match(/'(https:\/\/[^']+)'/)[1].split('safelink_redirect=')[1]).match(/"safelink":"(.*?)"/)[1]));
    }) : null;

    // button click for button after profitsfly (#aaoii2o button)
    function redirectToAnyLinkWithMatchingTextContent(textContent) {
        let intervalId = setInterval(() => {
            document.querySelectorAll("a").forEach(link => {
                if (link.textContent.includes("Get Link") && link.href) {
                    clearInterval(intervalId);
                    redirect(link.href);
                }
            });
        }, 500);
    }
    /((btcut|linkslice|zshort).io|easy4skip.com)\/.*\?token=.*/.test(url) ? afterDOMLoaded(function() {
        redirectToAnyLinkWithMatchingTextContent("Get Link");
    }) : null;

    // 10drives - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/233
    /foodtechnos.in/.test(url) ? afterDOMLoaded(function() {
        clickIfExists('a.btn:nth-child(1)');
        redirectIfExists('a#lsdwnbtn');
    }) : null;

    // zaku.pro/?adlinkfly= - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/236
    /zaku.pro/.test(url) ? afterDOMLoaded(function() {
        if (url.includes('go.zaku.pro')) {
            clickIfExists('button.btn-primary');
            redirectIfNotDisabled('a.get-link');
        } else {
            clickIfExists('#wpsafe-link > a:nth-child(1)');
        }
    }) : null;

    // aylink, cpmlink - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/238
    function redirectIfOnclickElementHasLink(selector) {
        let intervalId = setInterval(() => {
            let onclickContent = document.querySelector(selector).getAttribute('onclick');
            if (onclickContent) {
                clearInterval(intervalId);
                const targetLink = onclickContent.match(/window\.open\("([^"]+)",/)[1];
                redirect(targetLink);
            }
        }, 1000);
    }
    /aylink.co|cpmlink.pro/.test(url) ? afterWindowLoaded(function() {
        clickIfExistsNonStop('a.btn-go');
        redirectIfOnclickElementHasLink('#main');
    } ) : null;

    // adrinolinks.in - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/244
    /instaserve.net|gomob.xyz|gamechilly.online/.test(url) ? afterDOMLoaded(function() {clickIfExists('#tp-snp2');}) : null;

    // uii.io
    function checkAllCaptchasSolved() {
        return (checkCloudflareCaptchaSolved() && checkRecaptchaSolved() && checkHCaptchaSolved());
    }
    function clickIfAllCaptchasSolved(selector) {
        let intervalId = setInterval(() => {
            if (checkAllCaptchasSolved()) {
                clearInterval(intervalId);
                clickIfExists(selector);
            }
        }, 1000);
    }
    /wordcounter.icu/.test(url) ? afterDOMLoaded(function() {
        //clickIfAllCaptchasSolved('#invisibleCaptchaShortlink');
        clickIfExists('#invisibleCaptchaShortlink');
    }) : null;

    // cloudfam.io (rockmods.net)
    if (/techarmor.xyz/.test(url) && !url.includes('safe2.php')) {redirect("https://" + new URL(url).hostname + "/safe2.php");}
    /get.cloudfam.io/.test(url) ? afterDOMLoaded(function() {redirectIfNotDisabled('a.get-link');}) : null;

})();

(function() {
    'use strict';
    const url = window.location.href
    function boostTimers2() { // Overwrite setInterval and setTimeout
        const originalSetInterval = window.setInterval;
        const originalSetTimeout = window.setTimeout;
        window.setInterval = function(func, delay, ...args) {
            const newDelay = delay * 0.02;
            return originalSetInterval(func, newDelay, ...args);
        };
        window.setTimeout = function(func, delay, ...args) {
            const newDelay = delay * 0.02;
            return originalSetTimeout(func, newDelay, ...args);
        };
    }

    const urlPatternsForTimerBoost = [
        /www.gtaall.com\/get-manual/, // gtaall.com - https://github.com/FastForwardTeam/FastForward/issues/1348
        /motakhokhara.blogspot.com/, // psa.wf
        /besargaji.com/, // dramaday.me - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/21
        /^https:\/\/relampagomovies\.com\/.+/, // relampagomovies.com
        /goo.st|(businesssoftwarehere|freevpshere|softwaresolutionshere|travelironguide).com/, // goo.st - https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/215
        /((surfsees|travelagancy|venzoars|webbooki|pokoarcade|edigitalizes|finquizy).com|(fitnessholic|myindigocard).net|stockinsights.in|pandagamepad.co|techsl.online)(?!.*(safe\.php\?link=|&__cf_chl_tk=))/, // linkpays.in
        /hypershort.com/, // hyp.sh hypershort
        /bgmiaimassist.in|(stockwallah|inventoryidea).com/, // hdhub4u
        /owoanime.com|importantclass.com/ // vnshortener.com
    ];
    for (const pattern of urlPatternsForTimerBoost) {
        if (pattern.test(url)) {
            boostTimers2();
            if (typeof showAlert === 'function') {
                showAlert('Timers boosted', 'success', 1000, '', 'secondary');
            }
            break;
        }
    }

})();
// ----- ----- -----

//---Feedback for users---------------------------------------------------------------------
/**
 * Shows a styled alert popup with customizable type, duration and position
 * @param {string} message - The message to display
 * @param {string} type - Alert type: 'info', 'success', 'error', or 'warning'
 * @param {number} duration - How long to show the alert in milliseconds
 * @param {string} prefix - Text prefix before the message
 * @param {string} position - Position of alert: 'primary' (top) or 'secondary' (below primary)
 */
function showAlert(message, type = 'info', duration = 1000, prefix = 'Bypass script: ', position = 'primary') {
    // Create alert element
    const alertDiv = document.createElement('div');
    
    // Set positioning styles
    alertDiv.style.position = 'fixed';
    alertDiv.style.left = '50%';
    alertDiv.style.transform = 'translateX(-50%)';
    alertDiv.style.zIndex = '9999';
    alertDiv.style.padding = '10px 20px';
    alertDiv.style.borderRadius = '5px';
    alertDiv.style.boxShadow = '0 4px 8px rgba(0,0,0,0.2)';
    alertDiv.style.textAlign = 'center';
    alertDiv.style.fontFamily = 'Arial, sans-serif';
    alertDiv.style.fontSize = '14px';
    alertDiv.style.maxWidth = '80%';
    alertDiv.style.transition = 'opacity 0.5s';
    
    // Set position based on parameter
    if (position === 'secondary') {
        alertDiv.style.top = '60px'; // Position below the primary alert
        alertDiv.dataset.position = 'secondary';
    } else {
        alertDiv.style.top = '10px'; // Default primary position
        alertDiv.dataset.position = 'primary';
    }
    
    // Set colors based on alert type
    switch(type) {
        case 'success':
            alertDiv.style.backgroundColor = '#4CAF50';
            alertDiv.style.color = 'white';
            prefix = '✅ ' + prefix + ':';
            break;
        case 'error':
            alertDiv.style.backgroundColor = '#F44336';
            alertDiv.style.color = 'white';
            prefix = '❌ ' + prefix + ':';
            break;
        case 'warning':
            alertDiv.style.backgroundColor = '#FF9800';
            alertDiv.style.color = 'white';
            prefix = '⚠️ ' + prefix + ':';
            break;
        default: // info
            alertDiv.style.backgroundColor = '#2196F3';
            alertDiv.style.color = 'white';
            prefix = 'ℹ️ ' + prefix + ':';
    }
    
    alertDiv.textContent = prefix + ' ' + message;
    
    // Check if any existing alerts would conflict
    const clearExistingAlert = () => {
        const existingAlerts = document.querySelectorAll(`div[data-position="${position}"]`);
        existingAlerts.forEach(alert => {
            if (alert.parentNode) {
                alert.style.opacity = '0';
                setTimeout(() => {
                    if (alert.parentNode) {
                        alert.parentNode.removeChild(alert);
                    }
                }, 300);
            }
        });
    };
    
    // Check if body exists, if not wait for it
    if (document.body) {
        clearExistingAlert();
        document.body.appendChild(alertDiv);
        
        // Remove after duration
        setTimeout(() => {
            alertDiv.style.opacity = '0';
            setTimeout(() => {
                if (alertDiv.parentNode) {
                    alertDiv.parentNode.removeChild(alertDiv);
                }
            }, 500);
        }, duration);
    } else {
        // Wait for body to be available
        document.addEventListener('DOMContentLoaded', () => {
            clearExistingAlert();
            document.body.appendChild(alertDiv);
            
            // Remove after duration
            setTimeout(() => {
                alertDiv.style.opacity = '0';
                setTimeout(() => {
                    if (alertDiv.parentNode) {
                        alertDiv.parentNode.removeChild(alertDiv);
                    }
                }, 500);
            }, duration);
        });
    }
    
    // Also log to console for debugging
    console.log(`[${prefix}] ${message}`);
}

showAlert("running...");

function redirectWithMessage(url) {
    showAlert("Redirecting to " + url, 'success', 3000, '', 'secondary');
    setTimeout(function() {window.location.assign(url);}, 1000);
}

//-------------------------------------------------------------------------------------

// ----- Bypass Fly Inc (rinku.me .pro, 7mb.io, ...) ------
// source: https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/165
(function() {
    "use strict";

    const domainRegex = /(actualpost|americanstylo|beautifulfashionnailart|dadinthemaking|glowandglamcorner|listofthis|lobirtech|travelperi|vepiv|seydisehirmansethaber|turkiyertg|tophotelsukraine|balatroltd|tenorminiuk|icryptowin|chronoat|ecoinfotec|bcsclass|mainitbd|newselab|dizok|uzaay|tophistoryview|9sblog|ubnem|techavash|6harfli|professionaley|playghub|apkvmod|apkallworld|techoflix|toplistee|games2mobile|nivtu|bflig|jplna|bilgilendirici|zoninews|smoplay|m-womenstyle|bnirfinance|fuyde).com|(makego|sakazi|momge|englishgrammarpro|arab-plus).net|askerlikforum.com.tr|misterio.ro|(forp|bevery|fanuze).xyz|gamcabd.org|gamerking.shop/
    if (domainRegex.test(window.location.href)) {

        // Replace addEventListener to prevent adblock detection
            // This replicates "aeld" from uBO - https://github.com/gorhill/ublock/wiki/Resources-Library#addeventlistener-defuserjs-
            // Based on filter by Suurp from https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-12079375
            // Save the original addEventListener method
                const originalAddEventListener = document.addEventListener;
                // Override the addEventListener method
                document.addEventListener = function(type, listener, options) {
                    // Check if the event type is 'DOMContentLoaded' and the listener matches the one we want to block
                    if (type === 'DOMContentLoaded' && listener.toString().includes('function(e)')) {
                        console.log('Blocked DOMContentLoaded event listener:', listener);
                        return; // Prevent the listener from being added
                    }
                    // Call the original addEventListener method for other cases
                    originalAddEventListener.call(document, type, listener, options);
                };

        // Backup the current Rinku.me Code in case we get to 404 and we need to try again
            // Function to get rinku code from URL parameters (example: https://listofthis.com/backup/w/?get=uPmc5&short=rinku.me)
            function getUrlParameter(name) {
                name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
                const regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
                const results = regex.exec(location.search);
                return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
            }
            // Save rinku code in memory
            if (window.location.href.includes('/backup/w/')) {
                const codeParameter = 'get';
                //alert('Saving Rinku.me code in memory... The code is ' + getUrlParameter(codeParameter));
                localStorage.setItem('getParam', getUrlParameter(codeParameter));
            }
        // Try again when getting to 404 page (example: https://listofthis.com/bypass.php)
        if (window.location.href.includes('/bypass.php')) {
            const savedGetParam = localStorage.getItem('getParam');
            if (savedGetParam) {
                //Wait for the DOM to be fully loaded (to see that it is a 404 page)
                window.addEventListener('load', function() {
                    //alert('Press OK to try again going to:\n' + `https://rinku.me/${savedGetParam}`);
                    window.location.href = `https://rinku.me/${savedGetParam}`;
                });
            }
        }

        // Wait for page to be fully loaded
        window.addEventListener('load', function() {

            // Override the hasFocus function
            document.hasFocus = function() {
                return true; // Always return true
            };

            // Functions to check for "Click Any Ad & Keep It Open For 15 Seconds To Continue" and reload the page if it exists
            function checkForMessage_fallback() {
                const paragraphs = document.getElementsByTagName("p");
                for (let p of paragraphs) {
                    if ((/.*Click.+Ad.*To.+Continue.*/is.test(p.textContent) || /.*Click.+Ad.*To.+Unlock.+Captcha.*/is.test(p.textContent) || /.*Open.*To.+Unlock.+Captcha.*/is.test(p.textContent) || /.*Open.*To.+Continue.*/is.test(p.textContent)) && isElementVisibleAndEnabled(p)) {
                        location.reload(); // Reload the page
                        return; // Exit the function after reloading
                    }
                }
            }

            function checkForMessage() {
                const p = document.getElementById("click");
                if (!p) {
                    checkForMessage_fallback();
                } else if (p.textContent.trim() !== "" && isElementVisibleAndEnabled(p)) {
                    location.reload(); // Reload the page
                }
            }

            // Function to check and click the button
            function clickStepButton() {
                const buttons = document.querySelectorAll("button");
                for (let button of buttons) {
                    if (button.textContent.includes("Step") && isElementVisibleAndEnabled(button)) {
                        button.click();
                        console.log("Clicked the button: ", button);
                        return; // Stop after clicking the first found button
                    }
                }
            }

            // Function to observe button changes
            function observeButtons() {
                const buttons = document.querySelectorAll("button");
                buttons.forEach(button => {
                    const observer = new MutationObserver(() => {
                        // Check if the button is enabled or visibility changed
                        if (isElementVisibleAndEnabled(button)) {
                            clickStepButton(); // Attempt to click if it meets criteria
                        }
                    });
                    observer.observe(button, {
                        attributes: true,
                        attributeFilter: ["disabled"] // Observe changes to the disabled attribute
                    });
                });
            }

            // Helper function to determine if an element is visible and enabled
            function isElementVisibleAndEnabled(el) {
                // Check if the element and all its parents are visible
                let currentElement = el;
                while (currentElement) {
                    const style = getComputedStyle(currentElement);
                    if (style.display === "none" || style.visibility === "hidden") {
                        return false; // Element or parent is not visible
                    }
                    currentElement = currentElement.parentElement; // Move up the DOM tree
                }
                // Check if the button is enabled
                return !el.disabled;
            }

            // Create a MutationObserver to detect DOM changes
            const observer = new MutationObserver(clickStepButton);

            // Observe changes in the entire document
            observer.observe(document.body, {
                childList: true,
                subtree: true
            });

            // Initial checks
            observeButtons();
            checkForMessage();
            clickStepButton();

            // Hide "Hey, thanks for your visit, good day!!" modal
            const interstitial = document.getElementById("interstitial");
            if (interstitial) {
                interstitial.style.display = "none";
            }

        });

    }
})();
// ----- End Bypass Rinku -----

// ----- Bypass mega-enlace ( Taken from AdGuard https://github.com/AdguardTeam/AdguardFilters/blob/b1622e8b387148509ca355e8070ffa5cdcf87525/SpanishFilter/sections/general_extensions.txt#L108 / https://github.com/AdguardTeam/AdguardFilters/issues/174863#issuecomment-1996735239) -----
// used in: pelisenhd.org latinomegahd.net gatonplayseries.com peliculasgd.net tododvdfull.com cinemaniahdd.net programasvirtualespc.net compucalitv.pro
(function() {
    if (/(mega-enlace|acortados).com/.test(window.location.href)) {
        const window = unsafeWindow; //Added so it works in ViolentMonkey instead of AdGuard

        //Adguard snippet expanded and modified
        ! function() {
            const e = e => { // The e function: It sends a POST request to the link shortener's server and performs some string replacements to modify the form data and action URL. Finally, it sends another POST request with the modified form data to the action URL.
                    const o = new XMLHttpRequest;
                    o.open("POST", "/check.php", !0), o.setRequestHeader("Content-type", "application/x-www-form-urlencoded"), o.send("a");
                    const t = atob(window.ext_site).replace(/[a-z]/gi, (e => String.fromCharCode(e.charCodeAt(0) + (e.toLowerCase() <= "m" ? 13 : -13))));
                    let n = e.replaceAll('\\"', '"');
                    n = n.replace("'+ api_key+ '", window.api_key), n = n.replace("'+ link_out+ \"", window.link_out), n = n.replace(/action="'\+ .*?\+ '"/, `action="${t}"`);
                    var a;
                    const i = (a = n, (new DOMParser).parseFromString(a, "text/html")).querySelector("form"),
                        r = new FormData(i),
                        c = new XMLHttpRequest;
                    c.open("POST", t, !0), c.send(r), window.tab2 = window, postMessage("_clicked_b", location.origin)
                },
                o = { // The o object: This object is a proxy that intercepts function calls. It checks if the function call includes the api_key parameter and performs additional modifications to the function's code. If the necessary conditions are met, it tries to bypass the link shortener by calling the e function.
                    apply: (o, t, n) => {
                        if (n[1] && n[1].includes("api_key")) {
                            const o = window.link_out,
                                t = window.api_key,
                                a = n[1].match(/window\.open\(.*?\(atob\(main_site\)\).*?("\/.*\.php\?.*=").*?("&.*?=").*?(api_key),"view"/),
                                i = a[1].replaceAll('"', ""),
                                r = a[2].replaceAll('"', ""),
                                c = n[1].match(/<form target=[\s\S]*?<\/form>/)[0];
                            if (n[1] = n[1].replace("window.location.href", "var nulled"), n[1] = n[1].replace("window.open(f", "location.assign(f"), n[1] = n[1].replace(/(parseInt\(c\.split\("-"\)\[0\]\)<= 0).*?(\)\{)/, "$1$2"), o && t && i && r && c) try {
                                "loading" === document.readyState ? window.addEventListener("load", (() => {
                                    //Check if there is already access permission before launching the POST requests for the bypass
                                    let button = document.querySelector('input[type="button"][id="contador"][value="IR AL ENLACE"]');
                                    if (!button){
                                        e(c); //Launch the POST requests
                                        // Check periodically if access is granted to click the button
                                        let intervalId = setInterval(() => {
                                            let button = document.querySelector('input[type="button"][id="contador"][value="Ir al enlace"]');
                                            if (button) {
                                                button.click();
                                                clearInterval(intervalId);
                                            }
                                        }, 1000);
                                    } else if (button) {
                                        button.click();
                                    }
                                }), {
                                    once: !0
                                }) : e(c)
                            } catch (e) {
                                console.debug(e)
                            }
                        }
                        return Reflect.apply(o, t, n)
                    }
                };
            window.Function.prototype.constructor = new Proxy(window.Function.prototype.constructor, o)
        }();


    }
})();
// ----- ----- -----


// ----- Bypass paster.so ------
(function() {
    'use strict';

    if (/^https:\/\/paster\.so\/\w+/.test(window.location.href)) {

        // List of excluded domains
        const excludedDomains = ['paster.so', 'google.com', 'cloudflareinsights.com', 'wikipedia.com', 'w3.org', 'hcaptcha.com', 'gstatic.com'];

        let overlayCreated = false;

        // Function to extract URLs from the page source code and remove duplicates
        function extractURLsFromPage() {
            const pageSource = document.documentElement.outerHTML;
            const urlRegex = /(?:https?|ftp):\/\/[^\s/$.?#].[^\s"]+/g;
            let urls = pageSource.match(urlRegex);
            if (urls) {
                const uniqueURLs = new Set(urls.map(url => url.split("\\")[0]));
                urls = Array.from(uniqueURLs);
            }
            return urls ? urls.filter(url => !excludedDomains.some(domain => url.includes(domain))) : [];
        }

        // Function to create the overlay element and add clickable URLs to it
        function addURLsToOverlay(urls) {
            const overlay = document.createElement('div');
            overlay.style.position = 'fixed';
            overlay.style.top = '50%';
            overlay.style.right = '20px'; // Adjusted to appear in the middle right corner
            overlay.style.transform = 'translateY(-50%)';
            overlay.style.padding = '10px';
            overlay.style.borderRadius = '5px';
            overlay.style.zIndex = '9999';
            overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.9)';
            overlay.style.color = '#fff';

            // Add title
            const title = document.createElement('h3');
            title.textContent = 'URLs found:';
            overlay.appendChild(title);

            const urlList = document.createElement('ul');
            urls.forEach(url => {
                const listItem = document.createElement('li');
                const link = document.createElement('a');
                link.textContent = url;
                link.href = url;
                link.target = '_blank'; // Open link in a new tab
                listItem.appendChild(link);
                urlList.appendChild(listItem);
            });

            overlay.appendChild(urlList);
            document.body.appendChild(overlay);
        }

        // Wait for the window to be fully loaded
        window.addEventListener('load', () => {
            if (!overlayCreated) {
                const extractedURLs = extractURLsFromPage();
                const redirect = (finalUrl) => typeof redirectWithMessage === 'function' ? redirectWithMessage(finalUrl) : redirect(finalUrl);
                if (extractedURLs.length === 1) {
                    redirect(extractedURLs[0]); // Redirect to the URL if only one URL is found
                } else if (extractedURLs.length > 1) {
                    addURLsToOverlay(extractedURLs); // Add URLs to overlay if more than one URL is found
                    overlayCreated = true;
                } else {
                    redirect(`https://adbypass.org/bypass?bypass=${encodeURIComponent(window.location.href)}`);
                }
            }
        });
    }
})();
// ---------

//---profitsfly reload helper----
(function() {
    "use strict";

    const domainRegex = /^https:\/\/(.*\.|)(playonpc.online|quins.us|(retrotechreborn|insurelean|ecosolardigest).com|gally.shop|qanin.xyz|evegor.net)\/.*/;
    if (domainRegex.test(window.location.href)) {

        // ---RELOAD DEAD-END PAGES---
        if (document.readyState === "complete") {
            onWindowLoad();
        } else {
            window.addEventListener('load', onWindowLoad);
        }

        function onWindowLoad() {

            // Continue immediately on the "Shortened link (Waiting)" page
            if (document.title === "Shortened link (Waiting)" && !window.location.href.includes("continue=true")) {
                // add continue=true to the URL
                window.location.href = window.location.href + '&continue=true';
            }

            // Function to check for messages like "Click any ad & keep it open for 15 seconds to continue" and reload the page if one exists
            let reloading = false;
            function checkForMessage() {
                const paragraphs = document.getElementsByTagName("p");
                for (let p of paragraphs) {
                    if (/.*click.+ad.*to.+continue.*/is.test(p.textContent) && isElementVisibleAndEnabled(p)) {
                        if (!reloading) location.reload(); // Reload the page
                        reloading = true;
                        return; // Exit the function after reloading
                    }
                }
                if (/Less than.+passed between actions.+try again/.test(document.body.textContent)) {
                    if (!reloading) location.reload(); // Reload the page
                    reloading = true;
                    return; // Exit the function after reloading
                }
            }

            // Helper function to determine if an element is visible and enabled
            function isElementVisibleAndEnabled(el) {
                // Check if the element and all its parents are visible
                let currentElement = el;
                while (currentElement) {
                    const style = getComputedStyle(currentElement);
                    if (style.display === "none" || style.visibility === "hidden") {
                        return false; // Element or parent is not visible
                    }
                    currentElement = currentElement.parentElement; // Move up the DOM tree
                }
                // Check if the button is enabled
                return !el.disabled;
            }

            setInterval(checkForMessage, 1000);
        }


        // ---After DOM loaded---
        document.addEventListener('DOMContentLoaded', function() {

            // Set auxiliary variables
            window.assDidCkeDone = true;

            // ---Remove YouTube modal and banner--- 
            // (alternative with uBO : https://github.com/uBlockOrigin/uAssets/discussions/17361#discussioncomment-11864776)
            if (unsafeWindow.youtubeVideoStepProceed) { unsafeWindow.youtubeVideoStepProceed();}
            const stickyBanner = document.querySelector(".mg-sticky-banner");
            if (stickyBanner) {stickyBanner.style.display = "none";}

            // ---Skip timers---
            const forcedTimerInitialValue = 7;
            function setTimer() {
                if (window.wT9882 > forcedTimerInitialValue) {
                    window.wT9882 = 1;
                }
            }
            window.wT9882 = forcedTimerInitialValue;
            setInterval(setTimer, 1000); //This function exists because if the site detects an adblocker, it switches the timer to 30, and that only happens in the last second or so

            /* ------------ Protect buttons from being removed ------------ */
            // Protect all buttons currently in the DOM
            function protectButtons() {
                const buttons = document.querySelectorAll("button");
                buttons.forEach((button) => protectElement(button));
            }

            // Protect a specific button by overriding its removal methods
            function protectElement(element) {
                if (element.__protected) return; // Avoid double protection

                // Override remove()
                const originalRemove = element.remove;
                element.remove = () => {};

                // Flag element as protected
                element.__protected = true;
            }

            // Monitor the DOM for dynamically added buttons
            const observer = new MutationObserver((mutationsList) => {
                mutationsList.forEach((mutation) => {
                    mutation.addedNodes.forEach((node) => {
                        if (node.tagName === "BUTTON") {
                            // Protect new button
                            protectElement(node);
                        }
                    });

                    mutation.removedNodes.forEach((node) => {
                        if (node.tagName === "BUTTON") {
                            // A button was removed. Re-add it:
                            mutation.target.appendChild(node); // Re-add the button
                            protectElement(node); // Re-protect it
                        }
                    });
                });
            });

            // Start observing the document for changes
            observer.observe(document.body, { childList: true, subtree: true });

            // Protect buttons already in the DOM
            protectButtons();
        });

    }
})();
//-------

// ----- partial autoclicker for soractrl used by moviesnipipay.me,... ------
// sites with similar pages not autoclicked for now: ssrmovies.promo, mkvcinemas.phd, freecoursesite.com
// source: https://codeberg.org/Amm0ni4/bypass-all-shortlinks-debloated/issues/14#issuecomment-2588262
// optional uBO filter for easier clicking: quickeemail.com###landing, .soractrl:others()

(function() {
    const domainRegex = /quickeemail.com/
    if (domainRegex.test(window.location.href)) {

      const fakeEvent = {isTrusted: true, originalEvent: {isTrusted: true}};

      // Wait for jQuery to load
      const waitForJQuery = setInterval(() => {
          if (typeof jQuery !== "undefined") {
              clearInterval(waitForJQuery);

              // Override jQuery's `.on` method
              const originalOn = unsafeWindow.jQuery.fn.on;

              unsafeWindow.jQuery.fn.on = function(eventType, selector, handler, ...args) {
                  // Check if it's a "click" event on #soralink-human-verif-main
                  if (eventType === "click" && (this.is("#soralink-human-verif-main") || this.is(selector === "#generater") || this.is("#showlink"))) {
                      // Call the function immediately if handler is directly passed
                      if (typeof selector === "function") {
                          selector(fakeEvent); // Call the function
                      } else if (typeof handler === "function") {
                          handler(fakeEvent); // Call the handler
                      }
                  }

                  // Call the original .on method
                  return originalOn.call(this, eventType, selector, handler, ...args);
              };

              // Check if the element #soralink-human-verif-main exists
              if (!document.getElementById("soralink-human-verif-main")) {
                  // This is the second and third step with #generater and #showlink
                  setInterval(() => {
                      unsafeWindow.jQuery("#pleasewaits").hide();
                      unsafeWindow.jQuery("#showlink").show();
                  }, 1000);
              }
          }
      }, 10); // Check every 10ms
    }
})();
// ----- -----
