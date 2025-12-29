Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)

Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	-- return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
	return ui.Line{
		ui.Span("   " .. ya.user_name()):fg("green"),
		ui.Span("   " .. ya.host_name()):fg("cyan"),
		ui.Span("   "):fg("yellow")
	}
end, 500, Header.LEFT)

function Tabs.height() return 0 end

Header:children_add(function()
  if #cx.tabs == 1 then return "" end
  local spans = {}
  for i = 1, #cx.tabs do
    spans[#spans + 1] = ui.Span(" " .. i .. " ")
  end
  spans[cx.tabs.idx]:reverse()
  return ui.Line(spans)
end, 9000, Header.RIGHT)

require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}

-- remove rounded border on selected line
function Entity:padding() return " " end
function Linemode:padding() return " " end

require("git"):setup()