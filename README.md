
# Robot Framework com Appium para Android Nativo

## Pré-requisitos

1. NodeJS
- Certifique-se de ter Node Instalado em sua máquina.
- Versão utilizada: `v18.16.0`


2. Appium: 
- Certifique-se de ter o Appium instalado em sua máquina. Você pode instalá-lo usando o npm (Node Package Manager). Execute o seguinte comando no terminal:

```bash
npm install -g appium@2.5.1
```

- O comando appium driver install uiautomator2 é usado para instalar o driver UiAutomator2 para o Appium. O UiAutomator2 é um driver de automação específico para dispositivos Android que oferece melhorias em relação ao driver original UiAutomator.

```bash
appium driver install uiautomator2
```

- O appium-doctor é uma ferramenta do Appium que ajuda a diagnosticar e corrigir problemas com a instalação e configuração do ambiente para automação de aplicativos móveis. Ele verifica os pré-requisitos necessários para o Appium funcionar corretamente e fornece feedback sobre o estado atual do seu ambiente.

- Ao executar o appium-doctor, ele verifica diversos componentes e dependências, incluindo:

1. Node.js e npm: Verifica se o Node.js está instalado e se as versões são compatíveis.
2. Xcode (para iOS): Verifica a presença e a versão do Xcode, necessário para automação de aplicativos iOS.
3. Android SDK (para Android): Verifica a instalação e a configuração do Android SDK, essencial para automação de aplicativos Android.
4. Java Development Kit (JDK): Verifica a presença do JDK, que é necessário para desenvolvimento Java e pode ser necessário para automação em alguns casos.
5. Outras Dependências: Verifica se outras dependências, como o Carthage (para iOS) e o Gradle (para Android), estão instaladas corretamente.
6. Variáveis de Ambiente: Verifica se as variáveis de ambiente necessárias, como ANDROID_HOME e JAVA_HOME, estão configuradas corretamente.

- Ao final da verificação, o appium-doctor exibe um resumo indicando quais componentes estão configurados corretamente e quais podem precisar de atenção. Ele também oferece sugestões sobre como corrigir possíveis problemas.

- Certifique-se de configurar todas as dependências citadas acima.

- Para usar o appium-doctor, você pode instalá-lo globalmente usando o seguinte comando:

```bash
npm istall -g appium-doctor
```
- E então, para executar o diagnóstico, basta digitar:

```bash
appium-doctor
```

3. Robot Framework: Instale o Robot Framework e a biblioteca AppiumLibrary. Execute os seguintes comandos:
   
```bash
pip install robotframework robotframework-appiumlibrary
```

## Running Tests

Inicie o Servidor Appium, a flag --allow-insecure=adb_shell permite comandos ADB através do Appium/Robot Framework:

```bash
  appium --allow-insecure=adb_shell
```

## Próximos passos

- Utilizar o Appium Container
