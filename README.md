# Lab Brute Force Linux


As senhas
```sh
root:$6$/e4rYtpf$4PWgO1p1GHRTlAKg40HOoIWwYPgANyz3z89CfSVU.4LO.tu8SRKPDBQpS8qKESnC82qcqYpi6BlhvAI00Eyum1:17763:0:99999:7:::
administrador:$6$V6S8NGWz$HQaafbWPO7XKtiZfkCxCfMU.Z3elk1TZvZmrJqVlQkVcpW2sL8yLkwVzXHPPEMVMta/gqOOwtheSILZOLaPiZ1:17763::::::
```

Contruindo a imagem
```sh
docker build -t "greenmind/bruteforcelinux:1" .
```

Podemos iniciar a maquina da seguinte forma
```sh
docker run -p 8022:22 "greenmind/bruteforcelinux:1"
```

Para logar na maquina 
```sh
ssh administrador@0.0.0.0 -p 8022
```

## Desafio
Quebre as senhas acima e pontue no CTF.