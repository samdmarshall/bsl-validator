var string testing = "hello, world"; var int a=1; var bool what = true; var float b;

# an old but useful character setup function by geyser
func SpawnNameFlagHealthReset(string n, int f, int h, int r){
    ai2_spawn(n); chr_teleport(n, f)
    if(h) chr_set_health(n, h)
    if(r) chr_inv_reset(n)
}

# can be like this ...
func wave_setup {
    # note that missing arguments are taken to be 0)
    SpawnNameFlagHealthReset Griffin 23 600
    SpawnNameFlagHealthReset Muro 22 2500
    SpawnNameFlagHealthReset F_Er89 22 80 1
    SpawnNameFlagHealthReset A_S1 24
} 