-- Punto de entrada del servidor. Sin sistemas implementados.
print("[Naruto RP] Servidor de pruebas iniciado correctamente.")

-- Punto de prueba basado en la plantilla oficial de BlankMap.
local spawn_location = Vector(-140, -120, 100)
local spawn_rotation = Rotator(0, -60, 0)

-- Crea un personaje y entrega su control al jugador que se conecta.
Player.Subscribe("Spawn", function(player)
    print("[Naruto RP] Jugador conectado. Creando personaje de pruebas.")

    local character = Character(spawn_location, spawn_rotation, "nanos-world::SK_Mannequin")
    print("[Naruto RP] Personaje creado en Vector(-140, -120, 100).")

    character:SetInputEnabled(true)
    character:SetCanJump(true)
    player:Possess(character)

    if player:GetControlledCharacter() == character then
        print("[Naruto RP] Personaje asignado correctamente. Controles y salto habilitados.")
    else
        print("[Naruto RP] No se ha podido confirmar la asignación del personaje.")
    end
end)

-- El personaje no se elimina automáticamente al desconectarse el jugador.
Player.Subscribe("Destroy", function(player)
    local character = player:GetControlledCharacter()

    if character then
        character:Destroy()
        print("[Naruto RP] Jugador desconectado. Personaje de pruebas eliminado.")
    else
        print("[Naruto RP] Jugador desconectado sin personaje controlado que eliminar.")
    end
end)
