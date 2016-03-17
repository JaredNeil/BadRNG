local parser = ParserLib:GetInstance("1.1")

local skills = {
  -- "Rake", -- For testing
  "Heroic Strike",
  "Shield Slam",
  "Sunder Armor",
  "Revenge"
}

local tanks = {
  -- ParserLib_SELF, -- For testing
  "Ahtia",
  "Sulg",
  "Henkebenke",
  "Nyo",
  "Percaso"
}

local bosses = {
  -- "Galak", -- For testing
  "Vaelastrasz",
  "Broodlord Lashlayer",
  "Chromagus"
}

function contains(list, item)
  for _, i in ipairs(list) do
    if item == i then
      return true
    end
  end
  return false
end


function BadRNG_OnLoad()
  -- parser:RegisterEvent("BadRNG", "CHAT_MSG_SPELL_SELF_DAMAGE", ParserLib_OnEvent) -- For testing
  parser:RegisterEvent("BadRNG", "CHAT_MSG_SPELL_PARTY_DAMAGE", ParserLib_OnEvent)
end

function ParserLib_OnEvent(event, info)
  if info.type == "miss" then
    if contains(tanks, info.source) then
      if contains(skills, info.skill) then
        local boss_match = false
        for _, boss in ipairs(bosses) do
          if string.find(info.victim, boss) then
            boss_match = true
          end
        end
        if boss_match then
          -- Everything matches. Do what you want here.
          SendChatMessage(arg1,"PARTY");
        end
      end
    end
  end
end