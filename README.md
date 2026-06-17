# Pametni ugovor za glasanje o ekskurziji (GlasanjeEkskurzija)
Pametni ugovor napisan u jeziku Solidity za glasanje o destinaciji studentske ekskurzije na Ethereum blockchain-u.
## O projektu (About)
Korisnici mogu glasati za jednu od četiri ponuđene destinacije (Prag, Pariz, Atina, Rim). Svakoj Ethereum adresi dozvoljen je samo jedan glas, čime se osigurava integritet glasanja. Ugovor prati rezultate u realnom vremenu, a vlasnik ugovora ima ekskluzivno pravo da resetuje rezultate glasanja.
## Funkcije (Functions)
- `glasaj(destinacijaID)` —> Slanje glasa za destinaciju korišćenjem ID broja (0 do 3).
- `dobijRezultate()` —> Vraća niz sa trenutnim brojem glasova za sve četiri destinacije.
- `dobijDestinacije()` —> Vraća nazive svih destinacija unetih u sistem.
- `jeGlasao(address)` —> Provera da li je određena adresa već iskoristila svoje pravo glasa.
- `resetujGlasanje()` —> Samo vlasnik (Owner only) može resetovati broj glasova na nulu.
## Razvoj (Development)
Ugovor je razvijen i testiran u Remix IDE okruženju koristeći verziju Solidity 0.8.x
