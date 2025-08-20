Actividades Clase01


1)	Instalación de Python, PIP y Librerias:

 En esta computadora ya tengo una vesion de python instalada por lo tanto se procede a verificar version y a seguir con los demás items.
 
 C:\Users\Usuario>python --version
Python 3.11.2

C:\Users\Usuario>python -m pip --version
pip 22.3.1 from C:\Users\Usuario\AppData\Local\Programs\Python\Python311\Lib\site-packages\pip (python 3.11)
[notice] A new release of pip available: 22.3.1 -> 25.2
[notice] To update, run: python.exe -m pip install --upgrade pip

C:\Users\Usuario>pip freeze
appdirs==1.4.4
distlib==0.4.0
filelock==3.18.0
six==1.17.0
virtualenv==20.4.6

2)  Creacion del entorno virtual:

C:\Users\Usuario>cd C:\Cosas\P III\EntornosVirtuales\piii_env
C:\Cosas\P III\EntornosVirtuales\piii_env>python -m venv piii_env

  /*Activamos el entorno virtual/

C:\Cosas\P III\EntornosVirtuales\piii_env>piii_env\Scripts\activate

  /*intalamos numpy y matplt en el entorno vitual*/

(piii_env) C:\Cosas\P III\EntornosVirtuales\piii_env>pip install numpy matplotlib
Successfully installed contourpy-1.3.3 cycler-0.12.1 fonttools-4.59.1 kiwisolver-1.4.9 matplotlib-3.10.5 numpy-2.3.2 packaging-25.0 pillow-11.3.0 pyparsing-3.2.3 python-dateutil-2.9.0.post0 six-1.17.0

(piii_env) C:\Cosas\P III\EntornosVirtuales\piii_env>pip freeze > ewquirements.txt

/*Prueba de Crear un archivo prueba_entorno.py*/


(piii_env) C:\Cosas\P III\EntornosVirtuales\piii_env>python "C:\Cosas\P III\EntornosVirtuales\piii_env\piii_env\prueba_entorno.py"
La suma de las primeras diez muestras es: 0.2829424064960297
  
  
Luego de crear, activar e instalar las librerías y scripts necesarios en el entorno virtual, la carpeta queda con los siguientes archivos y carpetas:


C:\Cosas\P III\EntornosVirtuales\piii_env\piii_env>dir /b
Include
Lib
prueba_entorno.py
pyvenv.cfg
Scripts
share

3) Primeros pasos con Git y GitHub:
- Crear una cuenta en GitHub si aún no la tienes.
- Crear un nuevo repositorio privado o público llamado curso-piii.
- Instalar e Inicializar Git en la carpeta de códigos y realizar las primeras confirmaciones:


Para poder subir archivos a tu repositorio de GitHub, necesitas seguir estos pasos básicos:
________________________________________
✅ 1. Tener Git instalado
Ya hablamos de esto, pero si no lo hiciste aún, instálalo desde git-scm.com.
________________________________________
✅ 2. Crear una cuenta en GitHub
Si no tienes una, regístrate en https://github.com.
________________________________________
✅ 3. Configurar Git en tu máquina
Abre la terminal y configura tu nombre y correo (deben coincidir con tu cuenta de GitHub):
git config --global user.name "Tu Nombre"
git config --global user.email "tuemail@example.com"
________________________________________
✅ 4. Crear o clonar un repositorio
•	Crear uno nuevo localmente:
mkdir mi-proyecto
cd mi-proyecto
git init
•	Clonar uno existente desde GitHub:
git clone https://github.com/usuario/repositorio.git
________________________________________
✅ 5. Agregar archivos y hacer commit
git add .
git commit -m "Primer commit"
________________________________________
✅ 6. Conectar el repositorio local con GitHub
Si creaste el repositorio en GitHub, copia la URL  y conéctalo:
git remote add origin https://github.com/usuario/repositorio.git
________________________________________
✅ 7. Subir los archivos
git push -u origin master
________________________________________
________________________________________

 
C:\Cosas\P III\Codigos\curso-piii-2025>git init
Initialized empty Git repository in C:/Cosas/P III/Codigos/curso-piii-2025/.git/
 
C:\Cosas\P III\Codigos\curso-piii-2025>git add .
 
C:\Cosas\P III\Codigos\curso-piii-2025>git commit -m "Primer Commit"
Author identity unknown
 

C:\Cosas\P III\Codigos\curso-piii-2025>git config user.name "Leandro Blanco"
 
C:\Cosas\P III\Codigos\curso-piii-2025>git config user.email "leandro.blanco.corp@gmail.com"
 
C:\Cosas\P III\Codigos\curso-piii-2025>git add .
 
C:\Cosas\P III\Codigos\curso-piii-2025>git commit -m "Primer commit"
[master (root-commit) e3567df] Primer commit
 3 files changed, 14 insertions(+)
 create mode 100644 clase01/Readme.md
 create mode 100644 clase01/prueba_entorno.py
 create mode 100644 clase01/requirements.txt
 
C:\Cosas\P III\Codigos\curso-piii-2025>
C:\Cosas\P III\Codigos\curso-piii-2025>
C:\Cosas\P III\Codigos\curso-piii-2025>git remote add origin https://github.com/leandroblanco/curso-piii-2025.git
 
C:\Cosas\P III\Codigos\curso-piii-2025>git branch -M main
 
C:\Cosas\P III\Codigos\curso-piii-2025>git push -u origin main
info: please complete authentication in your browser...
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
