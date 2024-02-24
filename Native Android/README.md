
# Robot Framework com Appium para Android Nativo

## Pré-requisitos

1. Appium: Certifique-se de ter o Appium instalado em sua máquina. Você pode instalá-lo usando o npm (Node Package Manager). Execute o seguinte comando no terminal:

`npm install -g appium`

2. Android SDK: Instale o Android Studio ou apenas o Android SDK para garantir que as dependências necessárias estejam presentes.

Adicione o caminho do Android SDK nas variáveis de ambiente.

`ANDROID_HOME` 
`C:\Users\Acer\AppData\Local\Android\Sdk`

`PATH` 
`%ANDROID_HOME%\tools` 
`%ANDROID_HOME%\platform-tools`

3. Java: Instale a última versão do Java e garanta que ela esteja devidamente adicionada nas variáveis de ambiente.

`JAVA_HOME` 
`C:\Program Files\Java\jdk-21`

4. Configuração do Dispositivo Android: Conecte um dispositivo Android ao computador ou configure um emulador Android.

Verifique se os comandos adb estão funcionando normalmente com o seguinte comando no terminal:

`adb devices`

5. Robot Framework: Instale o Robot Framework e a biblioteca AppiumLibrary. Execute os seguintes comandos:

`pip install robotframework`
`pip install robotframework-appiumlibrary`

## Running Tests

Inicie o Servidor Appium, a flag --allow-insecure=adb_shell permite comandos ADB através do Appium/Robot Framework:

```bash
  `appium --allow-insecure=adb_shell`
```





## Running Tests

Inicie o Servidor Appium, a flag --allow-insecure=adb_shell permite comandos ADB através do Appium/Robot Framework:

```bash
  `appium --allow-insecure=adb_shell`
```

