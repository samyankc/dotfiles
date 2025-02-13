--- @sync entry

local function notify_error(message)
    if type(message) == "string" then
      ya.notify({
        title = " smart-nav error ",
        content = "  "..message.."  ",
        timeout = 3
      })
    end
    -- ya.manager_emit("shell",{"echo '"..message.."'",block=true})
  end
  
  local BuiltIn = {
    Escape = function() ya.manager_emit("escape",{}) end,
    Leave = function() ya.manager_emit("leave",{}) end,
    Enter = function() ya.manager_emit("enter",{}) end,
    Arrow = function(Offset) ya.manager_emit("arrow",{Offset}) end
  }
  
  local ActionTable = {
    ['escape'] = function(st)
      BuiltIn.Escape()
    end,
    ['leave'] = function(st)
      BuiltIn.Leave()
    end,
    ['enter'] = function(st)
      if st.old ~= nil then return end 
      local h = cx.active.current.hovered
      if h and h.cha.is_dir then
        BuiltIn.Enter()
      end
    end,
    ['arrow']=function(st,arg)
      if arg == nil then
        notify_error("missing argument")
      else
        BuiltIn.Arrow(arg)
      end
    end,
  
  }
  
  local function entry(st,job)
    local Action = ActionTable[job.args[1]]
    if Action ~= nil then
      Action(st,job.args[2])
    else
      notify_error("Unsupported Argument ["..job.args[1] .." "..(job.args[2] or "").."]")
    end
      -- if st.old then
      --   Tab.layout, st.old = st.old, nil
      -- else
      --   st.old = Tab.layout
      --   Tab.layout = function(self)
      --     self._chunks = ui.Layout()
      --         :direction(ui.Layout.HORIZONTAL)
      --         :constraints({
      --             ui.Constraint.Percentage(0),
      --             ui.Constraint.Percentage(0),
      --             ui.Constraint.Percentage(100),
      --         })
      --         :split(self._area)
      --   end
      -- end
      -- ya.app_emit("resize", {})
  end
  
  local function enabled(st) return st.old ~= nil end
  
  return { entry = entry, enabled = enabled }
  