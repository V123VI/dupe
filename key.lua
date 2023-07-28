local function createUI()
    -- Código para criar a interface do usuário (como mostrado anteriormente)

    confirmButton.MouseButton1Click:Connect(function()
        local key = textBox.Text
        -- Aqui você pode adicionar a lógica para verificar a chave e tomar a ação apropriada.

        -- Exemplo de verificação da chave (substitua pela sua lógica):
        local chavesValidas = {
            "chave123",
            "outra_chave",
            "mais_uma_chave"
        }

        local chavePermitida = false
        for _, chave in ipairs(chavesValidas) do
            if key == chave then
                chavePermitida = true
                break
            end
        end

        if chavePermitida then
            -- Chave válida, fecha a UI
            gui:Destroy()

            -- Configurações para enviar ao servidor (como mostrado anteriormente)
        else
            -- Chave inválida, exibe uma mensagem de erro (opcional)
            print("Chave inválida. Tente novamente.")
        end
    end)
end

createUI()
