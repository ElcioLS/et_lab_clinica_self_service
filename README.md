# et_lab_clinica_self_service
# Projeto Flutter Mobile para Tablet 100% Responsivo - Fevereiro de 2024
Um projeto Flutter Mobile Aversão Android para Tablet com a funcionalidade de auto atendimento.
Cliente/Paciente efetua cadastro diretamente no sistema utilizando a coleta de informações pelo tablet.

## Sobre o projeto

Este projeto foi desenvolvido durante o evento Flutter Experience da academia do Flutter de Rodrigo Rahman.
Durante uma semana pude aprender através de aulas gratuitas no youtube muitas técnicas de programação.
Foi muito conhecimento adquirido ao longo do evento.

# O projeto em si consiste num sistema para clínicas de exames laboratoriais Multiplataforma. 
- Versão Mobile/Tablet: auto atendimento onde o próprio cliente faz cadastro no sistema com upload da carteirinha e pedidos médicos.
- Versão Desktop/Windows: Admin do projeto. Aqui os atendentes cadastram número do guichê que será exibido na tela a TV. Também atendem e chamam os pacientes cadastrados no auto atendimento, além visualizar a carteirinha e pedidos médicos do atendimentos.
- Versão Web: Exibe e Chama a senha e direciona para qual guichê vai ser. isso se dá em tempo real graças a utilização de Web Socket.

## Conhecimentos adquiridos e empregados

Conheci algumas funcionalidades novas do Dart e Flutter e aperfeiçoei minhas habilidades em lógica de programação.
Durante o evento pude notar uma evelução expressiva em meu nível de raciocínio e meu mindset de dev mobile.

## Packages utilizados nessa aplicação.

- et_lab_clinica_core:                    // Meu Package próprio desenvolvido no evento,
-    path: ../et_lab_clinica_core        // exclusivamente para ser usado em todas aplicações
-  asyncstate: ^2.1.1-dev.1
-  dotted_border: ^2.1.0
-  validatorless: ^1.2.3
-  signals_flutter: ^3.0.0
-  dio: ^5.4.0
-  shared_preferences: ^2.2.2
-  json_annotation: ^4.8.1
-  brasil_fields: ^1.14.2
-  camera: ^0.10.5+9
-  cupertino_icons: ^1.0.2
-  flutter_getit: ^2.0.0

-  flutter_lints: ^2.0.0
-  json_serializable: ^6.7.1
-  build_runner: ^2.4.8
