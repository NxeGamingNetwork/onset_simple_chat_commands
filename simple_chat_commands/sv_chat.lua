--[[ Addon by Wasied : https://github.com/Wasied/onset_simple_chat_commands/ ]]--

-- Ano config
local anoCommand = "ano"
local anoColor = "#c0392b"
local anoMin = 3
local anoMax = 200
-- Pub config
local pubCommand = "pub"
local pubColor = "#27ae60"
local pubMin = 3
local pubMax = 200


-- Trim function
local function trim(str)
    return str:gsub("^%s*(.-)%s*$", "%1")
end


-- Ano command
local function anoSystem(player, ...)
    if not IsValidPlayer(player) then return end

    local msg = trim(table.concat({...}, " "))
    local msgLen = string.len(msg)
    if msgLen < anoMin or msgLen > anoMax then return AddPlayerChat(player, "<span color=\"#ff3333\">Votre message doit contenir entre "..anoMin.." et "..anoMax.." caractères.</>") end

    AddPlayerChat(player, "<span color=\""..anoColor.."\">Votre message anonyme a bien été envoyé.</>")
    AddPlayerChatAll("<span color=\""..anoColor.."\">[Anonyme] "..msg.."</>")
end
AddCommand(anoCommand, anoSystem)


-- Pub command
local function pubSystem(player, ...)
    if not IsValidPlayer(player) then return end

    local msg = trim(table.concat({...}, " "))
    local msgLen = string.len(msg)
    if msgLen < pubMin or msgLen > pubMax then return AddPlayerChat(player, "<span color=\"#ff3333\">Votre message doit contenir entre "..pubMin.." et "..pubMax.." caractères.</>") end

    local name = GetPlayerName(player)
    AddPlayerChat(player, "<span color=\""..pubColor.."\">Votre publicité a bien été envoyée.</>")
    AddPlayerChatAll("<span color=\""..pubColor.."\">[Publicité] "..name.." : "..msg.."</>")
end
AddCommand(pubCommand, pubSystem)