Config.Intervals = {}
Config.Intervals['point'] = {
    idle = 1000,
    active = 0,
}

Config.Intervals['weapon'] = {
    idle = 800,
    active = 100,
}

Config.Intervals['perspective'] = {
    active = 80, -- That's the handler to calculate the offset of 3D Perspective. Higher value means less accuarcy
}