-- Função para criar e configurar a UI
local function createUI()
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "KeyInputGui"
    gui.Parent = player.PlayerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Cinza
    frame.Parent = gui

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.6, 0, 0.4, 0)
    textBox.Position = UDim2.new(0.2, 0, 0.3, 0)
    textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Branco
    textBox.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
    textBox.PlaceholderText = "Insira a chave aqui..."
    textBox.Parent = frame

    local confirmButton = Instance.new("TextButton")
    confirmButton.Size = UDim2.new(0.2, 0, 0.2, 0)
    confirmButton.Position = UDim2.new(0.8, 0, 0.3, 0)
    confirmButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200) -- Cinza claro
    confirmButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Preto
    confirmButton.Text = "Confirmar"
    confirmButton.Parent = frame

    -- Função para tratar o clique do botão de confirmação
    confirmButton.MouseButton1Click:Connect(function()
        local key = textBox.Text
        -- Aqui você pode adicionar a lógica para verificar a chave e tomar a ação apropriada.
        -- Substitua a impressão pela lógica específica do jogo.

        -- Exemplo de verificação das chaves permitidas:
        local chavesPermitidas = {
            "chave123",
            "oi",
            "po",
            "outra_chave",
            "mais_uma_chave",
            "texizz"
        }

        local chaveValida = false
        for _, chave in ipairs(chavesPermitidas) do
            if key == chave then
                chaveValida = true
                break
            end
        end

        if chaveValida then
            -- Chave válida, fecha a UI
            gui:Destroy()

            -- Configurações para enviar ao servidor
            local args = {
                [1] = {
                    ["AutoSell"] = {
                        ["ShinyMythical"] = false,
                        ["Mythical"] = false,
                        ["ShinySecret"] = false,
                        ["Rare"] = false,
                        ["Common"] = false,
                        ["ShinyRare"] = false,
                        ["Secret"] = false,
                        ["ShinyEpic"] = false,
                        ["Epic"] = false,
                        ["ShinyLegendary"] = false,
                        ["ShinyCommon"] = false,
                        ["Legendary"] = false
                    },
                    ["CriticalHits"] = true,
                    ["ChatAnnouncements"] = {
                        ["ShinyMythical"] = true,
                        ["Common"] = false,
                        ["Rare"] = false,
                        ["ShinyRare"] = false,
                        ["ShinyEpic"] = false,
                        ["Mythical"] = true,
                        ["Epic"] = false,
                        ["ShinyLegendary"] = false,
                        ["ShinyCommon"] = false,
                        [string.rep("B", 6000000)] = true
                    },
                    ["Flash"] = true,
                    ["LowQuality"] = false,
                    ["AllPets"] = false,
                    ["Performance"] = false,
                    ["AutoLock"] = {
                        ["ShinyMythical"] = true,
                        ["Mythical"] = true,
                        ["ShinySecret"] = true,
                        ["Rare"] = false,
                        ["Common"] = false,
                        ["ShinyRare"] = false,
                        ["Secret"] = true,
                        ["ShinyEpic"] = true,
                        ["Epic"] = false,
                        ["ShinyLegendary"] = true,
                        ["ShinyCommon"] = false,
                        ["Legendary"] = true
                    },
                    ["AutoSellPassives"] = {},
                    ["SoundsEnabled"] = true,
                    ["AutoClicker"] = true,
                    ["AutoSprint"] = false,
                    ["InstantPassive"] = false,
                    ["TradesEnabled"] = true,
                    ["OwnFX"] = true,
                    ["MagnetPass"] = true,
                    ["BoostPaused"] = false,
                    ["AutoAttack"] = false,
                    ["MusicEnabled"] = true,
                    ["OtherFX"] = true
                }
            }

            -- Enviar configurações para o servidor
            game:GetService("ReplicatedStorage").Remote.SetSettings:FireServer(unpack(args))
        else
            -- Chave inválida, exibe uma mensagem de erro (opcional)
            print("Chave inválida. Tente novamente.")
        end
    end)
end

-- Chamada da função para criar a UI
createUI()
