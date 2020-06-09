//figure geometriche elementari spettrali


    opcode geoTriangle, a, iiiiiiioo
idur, inumf, ifmin, ifmax, iamin, iamax, icenter, imode, itimes xin

/*
idur = durata totale
inumf = numero totale di formanti
ifmin, ifmax = min e max range frequenziale
iamin, iamax = min e max range di ampiezze
icenter = centro del triangolo ---> valori da 0 a 1
imode = opzionale: default 0 ---> triangolo rivolto verso l'alto; -1 ---> triangolo rivolto verso il basso
*/

ispec = ((ifmax - ifmin)/inumf)

if(imode == -1) then //reverse triangle
    imax = ifmax - (ispec * itimes)
    imin = (ifmax - (ispec * (itimes + 1)))
    else
        imax = (ifmin + (ispec * (itimes + 1)))
        imin = ifmin + (ispec * itimes)
    endif

ifreq = random(imin, imax)
iamp = random(iamin, iamax)

ienvControl = .001
iatk = (((itimes/inumf) * idur) * icenter) + ienvControl
irel = (((itimes/inumf) * idur) * (1 - icenter)) + ienvControl
isust = idur - (iatk + irel)

at = poscil(linseg:k(0, iatk - ienvControl, 0, ienvControl, iamp, isust, iamp, ienvControl, 0, irel - ienvControl, 0), ifreq)/inumf

if(itimes < inumf) then
    arec = geoTriangle(idur, inumf, ifmin, ifmax, iamin, iamax, icenter, imode, itimes + 1)
    //prints("gener. [%d]: fmin [%f]\fmax [%f]\tfreq generata [%f]\tamp [%f]\tatk=[%f]\tsust=[%f]\trel=[%f]\n", itimes, imin, imax, ifreq, iamp, iatk, isust, irel)
endif

ageo = (at + arec)
xout(ageo)
    endop


    opcode geoCircle, a, iiiiiio
idur, inumf, ifmin, ifmax, iamin, iamax, itimes xin

/*
idur = durata totale ---> corrisponde al diametro del cerchio
inumf = numero totale di generazioni
ifmin, ifmax = range frequenziale min <---> max
iamin, iamax = range d'ampiezze min <---> max
*/

ipi = $M_PI/2
icf = (ifmin + ifmax)/2 //frequenza centrale
istep = ((ifmax - ifmin)/inumf)/2 //step incremento/2 per parte sup ed inf

ip = cos(ipi * itimes/inumf) //angolo per il calcolo dell'attacco

ienvControl = .001
iatk = ((1 - ip) * idur/2) + ienvControl
irel = ((1 - ip) * idur/2) + ienvControl
isust = idur - (iatk + irel)

imin_sup = icf + (istep * itimes)
imax_sup = icf + (istep * (itimes + 1))
ifreq_sup = random(imin_sup, imax_sup)

imin_inf = icf - (istep * itimes)
imax_inf = icf - (istep * (itimes + 1))
ifreq_inf = random(imin_inf, imax_inf)

iamp = random(iamin, iamax)

asup = poscil(linseg:k(0, iatk - ienvControl, 0, ienvControl, iamp, isust, iamp, ienvControl, 0, irel - ienvControl, 0), ifreq_sup)/(inumf/2)
ainf = poscil(linseg:k(0, iatk - ienvControl, 0, ienvControl, iamp, isust, iamp, ienvControl, 0, irel - ienvControl, 0), ifreq_inf)/(inumf/2)

if(itimes < inumf) then
    arec = geoCircle(idur, inumf, ifmin, ifmax, iamin, iamax, itimes + 1)
    //prints("gener. [%d]: freq sup generata [%f]\tfreq inf generata [%f]\tamp [%f]\tatk=[%f]\tsust=[%f]\trel=[%f]\n", itimes, ifreq_sup, ifreq_inf, iamp, iatk, isust, irel)
endif

ageo = (asup + ainf + arec)
xout(ageo)
    endop


    opcode geoSquare, a, iiiiiio
idur, inumf, ifmin, ifmax, iamin, iamax, itimes xin

ispec = (ifmax - ifmin)/inumf

imax = ifmin + (ispec * (itimes + 1))
imin = ifmin + (ispec * itimes)

ifreq = random(imin, imax)
iamp = random(iamin, iamax)

iatk = .001
irel = .001
isust = idur - (iatk + irel)

as = poscil(linseg:k(0, iatk, iamp, isust, iamp, irel, 0), ifreq)/inumf

if(itimes < inumf) then
    arec = geoSquare(idur, inumf, ifmin, ifmax, iamin, iamax, itimes + 1)
    //prints("gener. [%d]: freq generata [%f]\tamp [%f]\tatk=[%f]\tsust=[%f]\trel=[%f]\n", itimes, ifreq, iamp, iatk, isust, irel)
endif

ageo = (as + arec)
xout(ageo)
    endop
