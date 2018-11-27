## Evaluación de redes
_Usuarios, grupos y permisos_

1. Creá los siguientes usuarios: `tux`, `gnu`, `net`
2. Creá los siguientes grupos: `superg`, `normalg`
3. Seteá como grupo primario a `superg` para los usuarios `tux` y `gnu`
4. Seteá como grupo secundario a `normalg` para todos los usuarios
5. Logueate como tux y creá los siguientes recursos: 

```bash
├── documento.txt
└── carpetita
    └── importante.txt
```
6. Setéa como usuario propietario del archivo `documento.txt` a `net`
7. Seteá como grupo propiedario del archivo `documento.txt` a `normalg`
8. Setéa los permisos de `documento.txt` como `rw-rw-r--`
9. Seteá como grupo propietario de `carpetita` a `superg`
10. Modifica los permisos de `carpetita` de forma recursiva como `r--rw-r--`