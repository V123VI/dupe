local function isValidKey(key)
    local url = "https://raw.githubusercontent.com/seu_usuario/seu_repositorio/main/confirmedkeys.txt"

    local response = game:GetService("HttpService"):GetAsync(url)
    local allowedKeys = {}
    for line in response:gmatch("[^\r\n]+") do
        table.insert(allowedKeys, line)
    end

    for _, allowedKey in ipairs(allowedKeys) do
        if allowedKey == key then
            return true
        end
    end

    return false
end

local function activateCode()
    -- Seu código para ativar o código após a chave correta ser inserida
end

-- Função para mostrar a UI
local function showUI(player)
    -- Seu código para exibir a UI
    local keyInput = -- Obtenha o campo de texto onde o jogador insere a chave
    local key = keyInput.Text

    if isValidKey(key) then
        activateCode()
    else
        print("Chave incorreta!")
    end
end

game.Players.PlayerAdded:Connect(showUI)
