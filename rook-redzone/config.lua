RookConfig = {
    Debug = false,

    Menu = 'ox', -- ox veya qb
    Target = 'qb', -- ox veya qb

    PedName = "a_m_m_beach_01",
    PedCoords = vector4(2722.26, 1362.201, 23.52399, 355.5351),

    TargetCoords = vector3(2722.26, 1362.201, 23.52399),
    TargetHeading = 355.5351,
    TargetLabel = 'Redzone Menü',
    TargetDistance = 2.5,
    TargetMinZ = 23,
    TargetMaxZ = 27,

    Redzone_Start_And_Stop_Command = "redzone",
    Admin_Group = "god",

    CooldownTime = 1, -- Cooldown suresi dakika olarak calisiyor
    RemainingTime = 1, -- Geri sayim suresi dakika olarak calisiyor

    Items = {
        {item = "weapon_dp9", amount = math.random(10, 20)},
    }
}

Locales = {
    Menu_Header = 'Redzone',
    Menu_Reward = 'Ödül al',
    Menu_StartRemainingTime = 'Geri sayım başlat',


    Redzone_Activated = 'Redzone bir admin tarafından aktif edildi.',
    Redzone_Deactivated = 'Redzone bir admin tarafından deaktif edildi.',
    Redzone_Cooldown_Ended = 'Redzone cooldown süresi bitti.',
    RemainingTime_Ended = 'Redzone geri sayım süresi bitti',
    Countdown_Started = 'Bir ekip redzone geri sayımını açtı.',
    Countdown_Already_Started = 'Geri sayım zaten başlatılmış.',
    Cooldown_Not_Ended = 'Redzone cooldown süresi bitmedi.',
    Reward_Not_Allowed_During_Active = 'Ödül alınabilirken geri sayım başlatamazsın.',
    Redzone_Not_Active = 'Redzone aktif değil.',
    Player_Reward_Claimed = 'Bir oyuncu ödülü aldı redzone cooldowni başladı.',
}