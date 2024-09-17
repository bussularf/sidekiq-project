# Sidekiq Project
* Descrição
Este projeto é uma aplicação Rails que demonstra o uso de Sidekiq para processamento de background jobs e MailCatcher para captura e visualização de e-mails em desenvolvimento. O projeto inclui um exemplo básico de envio de e-mails e a configuração para processar tarefas assíncronas usando Sidekiq.

* Funcionalidades
Sidekiq: Utilizado para gerenciar e processar jobs em background. Inclui configuração para retries e monitoramento via painel do Sidekiq.
MailCatcher: Ferramenta para capturar e visualizar e-mails enviados durante o desenvolvimento. Ideal para evitar o envio de e-mails reais em ambientes de desenvolvimento.
* Tecnologias Utilizadas
Ruby on Rails
Sidekiq
MailCatcher
PostgreSQL
* Requisitos
Ruby 3.2.2 ou superior
Rails 7.2.1
Redis (versão 6.2.0 ou superior para Sidekiq)
MailCatcher (para visualização de e-mails)

### Configuração do Ambiente

1 Instalação das Dependências
```
bundle install
```
2 Configuração do Redis

Instale o Redis (certifique-se de ter a versão 6.2.0 ou superior):

```
sudo apt install redis-server
```
Ou instale manualmente a versão necessária (caso não esteja disponível nos repositórios padrão).

3 Configuração do MailCatcher

Instale o MailCatcher:

```
gem install mailcatcher
```
Inicie o MailCatcher:

```
mailcatcher
```
O MailCatcher estará disponível em http://localhost:1080.

4 Configuração do Sidekiq

Certifique-se de que o Sidekiq está configurado corretamente no config/application.rb ou config/environments/development.rb:

```
config.active_job.queue_adapter = :sidekiq
Configuração do Rails para Envio de E-mails
```

No arquivo config/environments/development.rb, adicione a seguinte configuração para usar o MailCatcher:

```
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'localhost',
  port: 1025
}
```

Inicialização do Sidekiq

Para iniciar o Sidekiq, use o comando:

```
bundle exec sidekiq
```

Acesse o painel do Sidekiq em http://localhost:3000/sidekiq.

Executando a Aplicação
Inicie o servidor Rails:

```
rails server
```

Inicie o Sidekiq:

Em um terminal separado:

```
bundle exec sidekiq
```

Acesse a aplicação em:

```
http://localhost:3000
```

Verifique e-mails no MailCatcher:

Abra http://localhost:1080 para visualizar os e-mails capturados.

Licença
Este projeto é licenciado sob a MIT License.