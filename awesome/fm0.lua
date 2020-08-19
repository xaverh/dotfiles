local awful = require 'awful'
local naughty = require 'naughty'

local FM0 = {}

local radio_stations = {
	['🇬🇧 🔥\tBBC Radio 1'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_one.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_one.m3u8'
	},
	['🇬🇧 🧑🏿‍🎤\tBBC Radio 1Xtra'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_1xtra.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_1xtra.m3u8'
	},
	['🇬🇧 🎸\tBBC Radio 2'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_two.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_two.m3u8'
	},
	['🇬🇧 🎻\tBBC Radio 3'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_three.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_three.m3u8'
	},
	['🇬🇧 🎙️\tBBC Radio 4'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_fourfm.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_fourfm.m3u8'
	},
	['🇬🇧 🎙️\tBBC Radio 4 Extra'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_four_extra.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_four_extra.m3u8'
	},
	['🇬🇧 ⚽\tBBC Radio 5 Live'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_five_live.m3u8'
	},
	['🇬🇧 🏏\tBBC Radio 5 Live Sports Extra'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_five_live_sports_extra.m3u8'
	},
	['🇬🇧 🥑\tBBC Radio 6 Music'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_6music.m3u8'
	},
	['🇬🇧 🛕\tBBC Asian Networks'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_asian_network.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_asian_network.m3u8'
	},
	['🇬🇧 🏴󠁧󠁢󠁳󠁣󠁴󠁿\tBBC Radio Scotland'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_scotland_fm.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_scotland_fm.m3u8'
	},
	['🇬🇧 🏴󠁧󠁢󠁷󠁬󠁳󠁿\tBBC Radio Wales'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_wales_fm.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_wales_fm.m3u8'
	},
	['🇬🇧 💂🏻‍♂️\tBBC Local Radio London'] = {
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_london.m3u8',
		'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_london.m3u8'
	},
	['🇬🇧 🌍\tBBC World Service'] = {
		'http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws',
		'http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws_backup'
	},
	['🇺🇸 🪕\tWDVX – East Tennessee’s Own'] = {
		'https://wdvx.streamguys1.com/live.xspf',
		'https://wdvx.streamguys1.com/live.m3u'
	},
	['🇨🇭 🪕\tCountry Radio Switzerland'] = {
		'http://rs4.radiostreamer.com:8000', -- 128 k
		'https://www.countryradio.ch/crs-64.pls' -- 64 k
	},
	['🇦🇹 🥑\tRadio FM4'] = {
		'https://fm4shoutcast.sf.apa.at/listen.pls',
		'http://mp3stream1.apasf.apa.at'
	},
	['🇦🇹 🎸\tÖ3'] = {
		'https://oe3shoutcast.sf.apa.at/'
	},
	['🇺🇸 💃🏽\tWXNY – X 96.3 Nueva York'] = {
		'https://prod-107-23-202-222.wostreaming.net/univision-wxnyfmaac-imc1',
		'http://in.icy2.abacast.com/univision-wxnyfmaac-im.m3u'
	},
	['🇬🇧 💋\tKISS 100 London'] = {
		'http://listenapi.bauerradio.com/api8/sharpstream/?i=kissnational.aac',
		'http://tx.whatson.com/http_live_bauer.php?i=kissnational.aac'
	},
	['🇸🇬 🎸\tClass 95'] = {
		'http://playerservices.streamtheworld.com/api/livestream-redirect/CLASS95_PREM.m3u8',
		'http://mediacorp.rastream.com/950fm'
	},
	['🇺🇸 🦄\tNightwave Plaza'] = {'http://radio.plaza.one/opus'},
	['🇩🇪 🥑\tDeutschlandfunk Nova'] = {'http://st03.dlf.de/dlf/03/104/ogg/stream.ogg'},
	['🇩🇪 🎙️\tDeutschlandfunk'] = {
		'http://st01.dlf.de/dlf/01/104/ogg/stream.ogg',
		'https://www.deutschlandradio.de/streaming/dlf_hq_ogg.m3u'
	},
	['🇪🇸 🔥\tLos 40'] = {
		'https://21313.live.streamtheworld.com/LOS40AAC.aac',
		'https://20873.live.streamtheworld.com/LOS40AAC.aac'
	},
	['🇪🇸 💃🏽\tLos 40 Latin'] = {
		'https://17873.live.streamtheworld.com/LOS40AAC.aac',
		'https://20103.live.streamtheworld.com/LOS40_03AAC.aac',
		'https://20853.live.streamtheworld.com/LOS40_03AAC.aac'
	},
	['🇨🇴 💃🏽\tLos 40 Medellín'] = {
		'https://14073.live.streamtheworld.com/LOS40COL_MEDAAC.aac'
	},
	['🇺🇸 🤘🏻\tKLOS — 95.5 Southern California’s Classic Rock'] = {
		'http://19273.live.streamtheworld.com/KLOSFMAAC.aac'
	},
	['🇨🇭 🍺\tRadio Melody'] = {
		'https://fm1melody.ice.infomaniak.ch/fm1melody-128.mp3'
	},
	['🇩🇪 🍺\tHeimatradio Melodie'] = {
		'http://212.77.178.166:8020/',
		'http://212.77.178.166/listen.pls'
	},
	['🇩🇪 ✌🏻\tBayern 1 Oberbayern'] = {
		'http://streams.br.de/bayern1obb_2.m3u',
		'http://streams.br.de/bayern1obb_1.m3u'
	},
	['🇩🇪 🎙️\tBayern 2 Süd'] = {
		'http://streams.br.de/bayern2sued_2.m3u',
		'http://streams.br.de/bayern2sued_1.m3u'
	},
	['🇩🇪 🎸\tBayern 3'] = {
		'http://streams.br.de/bayern3_2.m3u',
		'http://streams.br.de/bayern3_1.m3u'
	},
	['🇩🇪 🎻\tBR Klassik'] = {
		'http://streams.br.de/br-klassik_2.m3u',
		'http://streams.br.de/br-klassik_1.m3u'
	},
	['🇩🇪 📰\tB5 aktuell'] = {
		'http://streams.br.de/b5aktuell_2.m3u',
		'http://streams.br.de/b5aktuell_1.m3u'
	},
	['🇩🇪 ⚽\tB5 plus'] = {
		'http://streams.br.de/b5plus_2.m3u',
		'http://streams.br.de/b5plus_1.m3u'
	},
	['🇩🇪 🍺\tBayern plus'] = {
		'http://streams.br.de/bayernplus_2.m3u',
		'http://streams.br.de/bayernplus_1.m3u'
	},
	['🇩🇪 🥑\tPuls'] = {
		'http://streams.br.de/puls_2.m3u',
		'http://streams.br.de/puls_1.m3u'
	},
	['🇩🇪 🏔️\tBR Heimat'] = {
		'http://streams.br.de/brheimat_2.m3u',
		'http://streams.br.de/brheimat_1.m3u'
	},
	{
		['lofi hip hop radio - beats to sleep/study to ☕️'] = {
			'https://www.youtube.com/watch?v=US6iyJKGNLI'
		}
	}
}

local function play(id, i)
	local i = i or 1
	if radio_stations[id][i] then
		awful.spawn.easy_async(
			{'mpv', '--mute=no', '--x11-name=FM0', '--force-window=yes', radio_stations[id][i]},
			function(_, _, _, exit)
				naughty.notify {
					title = string.format('Exitcode: %s, i: %s, Station: %s', exit, i, radio_stations[id][1])
				}
				if exit ~= 0 and exit ~= 4 and radio_stations[id][i + 1] then
					play(id, i + 1)
				end
			end
		)
	end
end

function FM0.start_radio()
	local stations = 'quit\n'
	for k in pairs(radio_stations) do
		stations = stations .. k .. '\n'
	end
	awful.spawn.easy_async_with_shell(
		'echo "' .. stations .. '" | dmenu -i -l 10 -p "Play …"',
		function(stdout)
			play(string.sub(stdout, 1, -2))
		end
	)
end

function FM0.get_menu()
	local menu = {}
	for k in pairs(radio_stations) do
		table.insert(
			menu,
			{
				k,
				function()
					play(k)
				end
			}
		)
	end
	return menu
end

return FM0
