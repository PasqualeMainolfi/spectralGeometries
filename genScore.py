import random as rd

class Istanze:
    def __init__(self, numeroIstanze, durataTotale, durataNota, numeroFormanti, fmin, fmax, frm, amin, amax):
        self.numeroIstanze = numeroIstanze
        self.durataTotale = durataTotale
        self.durataNota = durataNota
        self.numeroFormanti = numeroFormanti
        self.fmin = fmin
        self.fmax = fmax
        self.frm = frm
        self.amin = amin
        self.amax = amax
        self.lista = []

    def generaValori(self):
        for i in range(self.numeroIstanze):
            tipoLista = ["triangle", "circle", "square"]
            indxTipo = rd.randint(0, 2)
            tipo = tipoLista[indxTipo]
            a = rd.uniform(0, self.durataTotale)
            dur = rd.uniform(0.1, self.durataNota)
            nf = rd.randint(1, self.numeroFormanti)
            freq_min = rd.randrange(self.fmin, self.fmax) # calcolo della frequenza inferiore in un range min-max
            frange = rd.randrange(1, self.frm) # calcolo dell'ampiezza frequenziale
            freq_max = freq_min + frange # calcolo della frequenza superiore
            amp_min = rd.uniform(self.amin, self.amax/2)
            amp_max = rd.uniform(self.amax/2, self.amax)
            c = rd.uniform(0.0, 1.0)
            v = rd.randint(-1, 0)
            pan = rd.uniform(0.0, 1.0)

            linea = ""

            if(tipo == "triangle"):
                linea = ('i \t"%s" \t%3.3f \t%3.3f \t%3d \t%3.3f \t%3.3f \t%3.3f \t%3.3f \t%3.3f \t%3d \t%3.3f\n' %(tipo, a, dur, nf, freq_min, freq_max, amp_min, amp_max, c, v, pan))
            elif(tipo == "circle" or tipo == "square"):
                linea = ('i \t"%s" \t%3.3f \t%3.3f \t%3d \t%3.3f \t%3.3f \t%3.3f \t%3.3f \t%3.3f\n' %(tipo, a, dur, nf, freq_min, freq_max, amp_min, amp_max, pan))

            self.lista.append(linea)

        return(self.lista)

    def toScore(self):
        for i in self.lista:
            print(i)

ist = []
durataTotale = 10
ampMax = 0.606
n = 21
for i in range(n):
    numeroIstanze = rd.randint(3, 30)
    durataNota = rd.uniform(0.34, 1.2)
    numeroFormanti = rd.randint(7, 120)
    fmin = rd.randrange(150.0, 5000)
    fmax = rd.randrange(5000, 15000)
    freqRange = rd.randrange(10, 500)
    amin = rd.uniform(0.0, ampMax/2)
    amax = rd.uniform(ampMax/2, ampMax)

    nota = Istanze(numeroIstanze, durataTotale, durataNota, numeroFormanti, fmin, fmax, freqRange, amin, amax)
    ist.append(nota)

for j in ist:
    j.generaValori()
    j.toScore()
