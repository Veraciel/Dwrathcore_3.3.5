--[[
    Used to learn a random spell within the players current range. 
    NEED TO ADD LOGIC FOR LOCKOUTS, stops spells being learn if their pre-requisites arent known

    NEED TO ADD LOGIC FOR CURRENCY, act like ascension and deduct a currency each level if the player has it
        if they dont, dont learn the spell.
]]

local AIO = AIO or require("AIO")
local AioHandler = AIO.AddHandlers("RandomSpell", {})
isServer = AIO.IsServer()

WARRIOR={
    {{2457},{1},"",0},
    {{78},{1},"",0},
    {{100},{4},"",0},
    {{772},{4},"",0},
    {{6343},{6},"",0},
    {{1715},{8},"",0},
    {{7384},{12},"",0},
    {{694},{16},"",0},
    {{20230},{20},"",0},
    {{12328},{30},"",1},
    {{12294},{40},"",1},
    {{46924},{60},"",1},
    {{64382},{70},"",0},
    {{57755},{80},"",0},
    {{6673},{1},"",0},
    {{34428},{6},"",0},
    {{1160},{14},"",0},
    {{845},{20},"",0},
    {{12323},{20},"",1},
    {{5246},{22},"",0},
    {{5308},{24},"",0},
    {{1161},{26},"",0},
    {{2458},{30},"",0},
    {{20252},{30},"",0},
    {{1464},{30},"",0},
    {{12292},{30},"",1},
    {{18499},{32},"",0},
    {{1680},{36},"",0},
    {{6552},{38},"",0},
    {{23881},{40},"",1},
    {{1719},{50},"",0},
    {{60970},{50},"",1},
    {{469},{68},"",0},
    {{55694},{75},"",0},
    {{2687},{10},"",0},
    {{71},{10},"",0},
    {{72},{12},"",0},
    {{6572},{14},"",0},
    {{2565},{16},"",0},
    {{676},{18},"",0},
    {{12678},{20},"",0},
    {{12975},{20},"",1},
    {{871},{28},"",0},
    {{7386},{30},"",0},
    {{355},{30},"",0},
    {{12809},{30},"",1},
    {{50720},{40},"",1},
    {{23922},{40},"",0},
    {{20243},{50},"",1},
    {{46968},{60},"",1},
    {{23920},{64},"",0},
    {{3411},{70},"",0}, 
}
    
PALADIN={
    {{635},{1},"",0},
    {{21084},{1},"",0},
    {{1152},{8},"",0},
    {{633},{10},"",0},
    {{7328},{12},"",0},
    {{19742},{14},"",0},
    {{26573},{20},"",0},
    {{879},{20},"",0},
    {{19750},{20},"",0},
    {{5502},{20},"",0},
    {{19746},{22},"",0},
    {{10326},{24},"",0},
    {{20165},{30},"",0},
    {{20166},{38},"",0},
    {{4987},{42},"",0},
    {{2812},{50},"",0},
    {{25894},{54},"",0},
    {{31821},{20},"",1},
    {{20216},{30},"",1},
    {{20473},{40},"",1},
    {{31842},{50},"",1},
    {{53563},{60},"",1},
    {{54428},{71},"",0},
    {{53601},{80},"",0},
    {{465},{1},"",0},
    {{498},{6},"",0},
    {{853},{8},"",0},
    {{1022},{10},"",0},
    {{31789},{14},"",0},
    {{62124},{16},"",0},
    {{25780},{16},"",0},
    {{1044},{18},"",0},
    {{20217},{20},"",0},
    {{64205},{20},"",1},
    {{20164},{22},"",0},
    {{1038},{26},"",0},
    {{19876},{28},"",0},
    {{19752},{30},"",0},
    {{20911},{30},"",1},
    {{19888},{32},"",0},
    {{642},{34},"",0},
    {{19891},{36},"",0},
    {{20925},{40},"",1},
    {{6940},{46},"",0},
    {{31935},{50},"",1},
    {{25898},{60},"",0},
    {{25899},{60},"",0},
    {{53595},{60},"",1},
    {{19740},{4},"",0},
    {{20271},{4},"",0},
    {{53408},{12},"",0},
    {{7294},{16},"",0},
    {{20375},{20},"",1},
    {{53407},{28},"",0},
    {{20066},{40},"",1},
    {{24275},{44},"",0},
    {{35395},{50},"",1},
    {{25782},{52},"",0},
    {{53385},{60},"",1},
    {{32223},{62},"",0},
    {{31801},{64},"",0},
    {{31884},{70},"",0},
}
    
HUNTER={
    {{13163},{4},"",0},
    {{13165},{10},"",0},
    --{{883},{10},"",0},
    --{{2641},{10},"",0},
    {{6991},{10},"",0},
    {{982},{10},"",0},
    {{1579},{10},"",0},
    --{{1515},{10},"",0},
    {{136},{12},"",0},
    {{6197},{14},"",0},
    {{1002},{14},"",0},
    {{1513},{14},"",0},
    {{5118},{16},"",0},
    {{34074},{20},"",0},
    {{1462},{24},"",0},
    {{13161},{30},"",0},
    {{19577},{30},"",1},
    {{19574},{40},"",1},
    {{13159},{40},"",0},
    {{20043},{46},"",0},
    {{62757},{60},"",0},
    {{34026},{66},"",0},
    {{61846},{74},"",0},
    {{53271},{75},"",0},
    {{75},{1},"",0},
    {{1978},{4},"",0},
    {{3044},{6},"",0},
    {{1130},{6},"",0},
    {{5116},{8},"",0},
    {{20736},{12},"",0},
    {{2643},{18},"",0},
    {{19434},{20},"",1},
    {{3043},{22},"",0},
    {{3045},{26},"",0},
    {{23989},{30},"",1},
    {{1543},{32},"",0},
    {{3034},{36},"",0},
    {{1510},{40},"",0},
    {{19506},{40},"",1},
    {{56641},{50},"",0},
    {{34490},{50},"",1},
    {{53209},{60},"",1},
    {{19801},{60},"",0},
    {{53351},{71},"",0},
    {{2973},{1},"",0},
    {{1494},{1},"",0},
    {{19883},{10},"",0},
    {{2974},{12},"",0},
    {{13795},{16},"",0},
    {{1495},{16},"",0},
    {{19884},{18},"",0},
    {{781},{20},"",0},
    {{1499},{20},"",0},
    {{19503},{20},"",1},
    {{19885},{24},"",0},
    {{19880},{26},"",0},
    {{13809},{28},"",0},
    {{5384},{30},"",0},
    {{19306},{30},"",1},
    {{19878},{32},"",0},
    {{13813},{34},"",0},
    {{19386},{40},"",1},
    {{19882},{40},"",0},
    {{19879},{50},"",0},
    {{3674},{50},"",1},
    {{53301},{60},"",1},
    {{19263},{60},"",0},
    {{34600},{68},"",0},
    {{34477},{70},"",0},
    {{60192},{80},"",0},
}
    
ROGUE={
    {{2098},{1},"",0},
    {{5171},{10},"",0},
    {{8647},{14},"",0},
    {{703},{14},"",0},
    {{8676},{18},"",0},
    {{51722},{20},"",0},
    {{1943},{20},"",0},
    {{1833},{26},"",0},
    {{408},{30},"",0},
    {{14177},{30},"",1},
    {{1329},{50},"",1},
    {{51662},{60},"",1},
    {{32645},{62},"",0},
    {{26679},{64},"",0},
    {{2842},{65},"",0},
    {{1752},{1},"",0},
    {{53},{4},"",0},
    {{1776},{6},"",0},
    {{5277},{8},"",0},
    --{{2983},{10},"",0},
    {{1766},{12},"",0},
    {{1966},{16},"",0},
    {{14251},{20},"",1},
    {{13877},{30},"",1},
    {{13750},{40},"",1},
    {{51690},{60},"",1},
    {{5938},{70},"",0},
    {{51723},{80},"",0},
    {{1784},{1},"",0},
    {{921},{4},"",0},
    {{6770},{10},"",0},
    {{14278},{20},"",1},
    {{1725},{22},"",0},
    {{1856},{22},"",0},
    {{2836},{24},"",0},
    {{1842},{30},"",0},
    {{14185},{30},"",1},
    {{16511},{30},"",1},
    {{2094},{34},"",0},
    {{1860},{40},"",0},
    {{14183},{40},"",1},
    {{36554},{50},"",1},
    {{51713},{60},"",1},
    {{31224},{66},"",0},
    {{57934},{75},"",0},
}
    
PRIEST={
    {{1243},{1},"",0},
    {{17},{6},"",0},
    {{588},{12},"",0},
    {{527},{18},"",0},
    {{6346},{20},"",0},
    {{9484},{20},"",0},
    {{14751},{20},"",1},
    {{8129},{24},"",0},
    {{14752},{30},"",0},
    {{1706},{34},"",0},
    {{10060},{40},"",1},
    {{21562},{48},"",0},
    {{33206},{50},"",1},
    {{27681},{60},"",0},
    {{47540},{60},"",1},
    {{32375},{70},"",0},
    {{2050},{1},"",0},
    {{585},{1},"",0},
    {{139},{8},"",0},
    {{2006},{10},"",0},
    {{528},{14},"",0},
    {{2054},{16},"",0},
    {{2061},{20},"",0},
    {{14914},{20},"",0},
    {{15237},{20},"",0},
    {{19236},{20},"",1},
    {{596},{30},"",0},
    {{552},{32},"",0},
    {{724},{40},"",1},
    {{2060},{40},"",0},
    {{34861},{50},"",1},
    {{47788},{60},"",1},
    {{64901},{60},"",0},
    {{32546},{64},"",0},
    {{33076},{68},"",0},
    {{64843},{80},"",0},
    {{589},{4},"",0},
    {{586},{8},"",0},
    {{8092},{10},"",0},
    {{8122},{14},"",0},
    {{2944},{20},"",0},
    {{453},{20},"",0},
    {{15407},{20},"",1},
    {{2096},{22},"",0},
    {{605},{30},"",0},
    {{976},{30},"",0},
    {{15487},{30},"",1},
    {{15286},{30},"",1},
    {{15473},{40},"",1},
    {{64044},{50},"",1},
    {{34914},{50},"",1},
    {{27683},{56},"",0},
    {{47585},{60},"",1},
    {{32379},{62},"",0},
    {{34433},{66},"",0},
    {{48045},{75},"",0},
}
    
SHAMAN={
    {{403},{1},"",0},
    {{8042},{4},"",0},
    {{2484},{6},"",0},
    {{5730},{8},"",0},
    {{8050},{10},"",0},
    {{3599},{10},"",0},
    {{1535},{12},"",0},
    {{370},{12},"",0},
    {{57994},{16},"",0},
    {{8056},{20},"",0},
    {{8190},{26},"",0},
    {{66842},{30},"",0},
    {{421},{32},"",0},
    {{66843},{40},"",0},
    {{16166},{40},"",1},
    {{66844},{50},"",0},
    {{30706},{50},"",1},
    {{51490},{60},"",1},
    {{2894},{68},"",0},
    {{51505},{75},"",0},
    {{51514},{80},"",0},
    {{8017},{1},"",0},
    {{8071},{4},"",0},
    {{324},{8},"",0},
    {{8024},{10},"",0},
    {{8075},{10},"",0},
    {{2645},{16},"",0},
    {{8033},{20},"",0},
    {{131},{22},"",0},
    {{8181},{24},"",0},
    {{6196},{26},"",0},
    {{8184},{280},"",0},
    {{8227},{28},"",0},
    {{546},{28},"",0},
    {{556},{30},"",0},
    {{8177},{30},"",0},
    {{10595},{30},"",0},
    {{8232},{30},"",0},
    {{8512},{32},"",0},
    {{6495},{34},"",0},
    {{17364},{40},"",1},
    {{60103},{45},"",1},
    {{30823},{50},"",1},
    {{51533},{60},"",1},
    {{3738},{64},"",0},
    {{2062},{66},"",0},
    {{32182},{70},"",0},
    {{2825},{70},"",0},	-- Horde
    {{331},{1},"",0},
    {{2008},{12},"",0},
    {{526},{16},"",0},
    {{8143},{18},"",0},
    {{5394},{20},"",0},
    {{8004},{20},"",0},
    {{52127},{20},"",0},
    {{55198},{20},"",1},
    {{5675},{26},"",0},
    {{51730},{30},"",0},
    {{20608},{30},"",0},
    {{36936},{30},"",0},
    {{16188},{30},"",1},
    {{8170},{38},"",0},
    {{1064},{40},"",0},
    {{16190},{40},"",1},
    {{974},{50},"",1},
    {{61295},{60},"",1},
}
    
MAGE={
    {{1459},{1},"",0},
    {{5504},{4},"",0},
    {{587},{6},"",0},
    {{5143},{8},"",0},
    {{118},{8},"",0},
    {{604},{12},"",0},
    {{130},{12},"",0},
    {{1449},{14},"",0},
    {{1008},{18},"",0},
    {{475},{18},"",0},
    {{1953},{20},"",0},
    {{12051},{20},"",0},
    {{1463},{20},"",0},
    {{3562},{20},"",0},
    {{3563},{20},"",0},		-- Horde
    {{3561},{20},"",0},
    {{3567},{20},"",0},		-- Horde
    {{54646},{20},"",1},
    {{2139},{24},"",0},
    {{759},{28},"",0},
    {{3565},{30},"",0},
    {{32271},{30},"",0},
    {{3566},{30},"",0},		-- Horde
    {{32272},{30},"",0},		-- Horde
    {{12043},{30},"",1},
    {{6117},{34},"",0},
    {{49359},{35},"",0},
    {{49358},{35},"",0},		-- Horde
    {{49360},{35},"",0},
    {{49361},{35},"",0},			-- Horde
    {{32266},{40},"",0},
    {{11417},{40},"",0},			-- Horde
    {{11416},{40},"",0},
    {{32267},{40},"",0},		-- Horde
    {{10059},{40},"",0},
    {{11418},{40},"",0},		-- Horde
    {{12042},{40},"",1},
    {{11419},{50},"",0},
    {{11420},{50},"",0},		-- Horde
    {{31589},{50},"",1},
    {{23028},{56},"",0},
    {{44425},{60},"",1},
    {{30451},{64},"",0},
    {{33691},{65},"",0},
    {{66},{68},"",0},
    {{43987},{70},"",0},
    {{30449},{70},"",0},
    {{133},{1},"",0},
    {{2136},{6},"",0},
    {{2120},{16},"",0},
    {{543},{20},"",0},
    {{2948},{22},"",0},
    {{11366},{20},"",1},
    {{11113},{30},"",1},
    {{11129},{40},"",1},
    {{31661},{50},"",1},
    {{44457},{60},"",1},
    {{30482},{62},"",0},
    {{44614},{75},"",0},
    {{168},{1},"",0},
    {{116},{4},"",0},
    {{122},{10},"",0},
    {{10},{20},"",0},
    {{12472},{20},"",1},
    {{6143},{22},"",0},
    {{120},{26},"",0},
    {{7302},{30},"",0},
    {{45438},{30},"",0},
    {{11958},{30},"",1},
    {{11426},{40},"",1},
    {{31687},{50},"",1},
    {{44572},{60},"",1},
    {{30455},{66},"",0},
}
    
WARLOCK={
    {{172},{4},"",0},
    {{702},{4},"",0},
    {{1454},{6},"",0},
    {{980},{8},"",0},
    {{5782},{8},"",0},
    {{1120},{10},"",0},
    {{689},{14},"",0},
    {{5138},{24},"",0},
    {{1714},{26},"",0},
    {{18223},{30},"",1},
    {{1490},{32},"",0},
    {{5484},{40},"",0},
    {{18220},{40},"",1},
    {{6789},{42},"",0},
    {{30108},{50},"",1},
    {{48181},{60},"",1},
    {{603},{60},"",0},
    {{27243},{70},"",0},
    {{687},{1},"",0},
    {{688},{4},"",0},
    {{6201},{10},"",0},
    {{697},{10},"",0},
    {{755},{12},"",0},
    {{5697},{16},"",0},
    {{693},{18},"",0},
    {{706},{20},"",0},
    {{698},{20},"",0},
    {{712},{20},"",0},
    {{19028},{20},"",1},
    {{18708},{20},"",1},
    {{126},{22},"",0},
    {{5500},{24},"",0},
    {{132},{26},"",0},
    {{710},{28},"",0},
    {{6366},{28},"",0},
    {{1098},{30},"",0},
    {{691},{30},"",0},
    {{6229},{32},"",0},
    {{2362},{36},"",0},
    {{47193},{40},"",1},
    {{30146},{50},"",1},
    {{59671},{50},"",0},
    {{54784},{50},"",0},
    {{50589},{50},"",0},
    {{1122},{50},"",0},
    {{18540},{50},"",0},
    {{47241},{60},"",1},
    {{28176},{62},"",0},
    {{29858},{66},"",0},
    {{29893},{68},"",0},
    {{48018},{80},"",0},
    {{48020},{80},"",0},		-- 59672
    {{686},{1},"",0},
    {{348},{1},"",0},
    {{5676},{18},"",0},
    {{5740},{20},"",0},
    {{17877},{20},"",1},
    {{1949},{30},"",0},
    {{17962},{40},"",1},
    {{6353},{48},"",0},
    {{30283},{50},"",1},
    {{50796},{60},"",1},
    {{29722},{64},"",0},
    {{47897},{75},"",0},
}
    
DRUID = {
    {{5176},{1},"",0},
    {{8921},{4},"",0},
    {{467},{6},"",0},
    {{339},{8},"",0},
    {{16689},{10},"",0},
    {{770},{18},"",0},
    {{2637},{18},"",0},
    {{2912},{20},"",0},
    {{2908},{22},"",0},
    {{5570},{30},"",1},
    {{24858},{40},"",1},
    {{16914},{40},"",0},
    {{29166},{40},"",0},
    {{22812},{44},"",0},
    {{33831},{50},"",1},
    {{50516},{50},"",1},
    {{48505},{60},"",1},
    {{33786},{70},"",0},
    {{99},{10},"",0},
    {{6795},{10},"",0},
    {{6807},{10},"",0},
    {{5229},{12},"",0},
    {{5211},{14},"",0},
    {{5487},{15},"",0},
    {{1066},{16},"",0},
    {{779},{16},"",0},
    {{783},{16},"",0},
    {{16857},{18},"",0},
    {{768},{20},"",0},
    {{1082},{20},"",0},
    {{5215},{20},"",0},
    {{1079},{20},"",0},
    {{61336},{20},"",1},
    {{5221},{22},"",0},
    {{1822},{24},"",0},
    {{5217},{24},"",0},
    {{1850},{26},"",0},
    {{5209},{28},"",0},
    {{8998},{28},"",0},
    {{22568},{32},"",0},
    {{6785},{32},"",0},
    {{5225},{32},"",0},
    {{16979},{30},"",1},		-- 49377
    {{49376},{30},"",1},		-- 49377
    {{22842},{36},"",0},
    {{9005},{36},"",0},
    {{9634},{40},"",0},
    {{20719},{40},"",0},
    {{62600},{40},"",0},
    {{33878},{50},"",1},		--33917
    {{33876},{50},"",1},		--33917
    {{50334},{60},"",1},
    {{22570},{62},"",0},
    {{33745},{66},"",0},
    {{62078},{71},"",0},
    {{52610},{75},"",0},
    {{5185},{1},"",0},
    {{1126},{1},"",0},
    {{8946},{4},"",0},
    {{774},{4},"",0},
    {{8936},{12},"",0},
    {{50769},{12},"",0},
    {{20484},{20},"",0},
    {{2782},{24},"",0},
    {{2893},{26},"",0},
    {{740},{30},"",0},
    {{17116},{30},"",1},
    {{18562},{40},"",1},
    {{33891},{50},"",1},	-- 65139
    {{21849},{50},"",0},
    {{48438},{60},"",1},
    {{33763},{64},"",0},
    {{50464},{80},"",0},
}

spelltable = {DRUID, HUNTER, MAGE, PALADIN, PRIEST, ROGUE, SHAMAN, WARLOCK, WARRIOR,}

local PLAYER_EVENT_ON_LEVEL_CHANGE = 13

local function DingSpell (event, player, oldlvl)
    local curlvl = player:GetLevel()
    local curlvlspells = {}
    local int = 1 -- used for he curlvlspells table for indexing
    if (curlvl >= oldlvl and curlvl % 2 == 0) then
        --Roll spells
        for i,v in pairs(spelltable) do -- Iterates through classes in spelltable
            for e, d in pairs(v) do -- Iterates through spell-infos in classtable
                local curspell = d[1][1] -- SpellID
                local curspelllvl = d[2][1] -- Spell ReqLevel

                if (player:HasSpell(curspell) == false) then
                    if (curspelllvl == curlvl) then 
                        curlvlspells[int] = curspell
                        int = int + 1
                    elseif(curspelllvl <= curlvl) then
                        curlvlspells[int] = curspell
                        int = int + 1
                    end
                end
            end
        end
    end
    if (next(curlvlspells) == nil) then 
        return 
    else
        RollSpell(player, curlvlspells)
    end
end

local function toTable(string)
    local t = {}
    if string ~= "" then
        for i in string.gmatch(string, "([^,]+)") do
            table.insert(t, tonumber(i))
        end
    end
    return t
end

local function toString(tbl)
    local string = ""
    if #tbl > 1 then
        string = table.concat(tbl, ",")
    elseif #tbl == 1 then
        string = tbl[1]
    end
    return string
end



function RollSpell(player, torollspells)
    local roll = torollspells[math.random(#torollspells)]
    AIO.Handle(player, "RandomSpell", "LoadMsg", roll)
    AIO.Handle(player, "RandomSpell", "ShowFrame")
    -- DB QUERY JUNK
    local pguid =player:GetGUIDLow()
    local qspells = CharDBQuery("SELECT spells FROM character_classless WHERE guid = " .. tostring(pguid))
    local qspellstr = qspells:GetString(0)
    knownspells = toTable(qspellstr)
    lastspell = #knownspells + 1
    knownspells[lastspell] = roll
    stringspell = toString(knownspells)
    CharDBQuery("UPDATE character_classless SET spells ='" .. stringspell .. "' WHERE guid = " .. tostring(pguid))
    player:LearnSpell(roll)
    player:SaveToDB()
    roll = nil
end

RegisterPlayerEvent(PLAYER_EVENT_ON_LEVEL_CHANGE, DingSpell)