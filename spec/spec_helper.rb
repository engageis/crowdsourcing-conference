# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def post_moip_params
  {
    :id_transacao => 'ABCD',
    :valor => 99900, #=> R$ 21,90
    :status_pagamento => 3,
    :cod_moip => 12345123,
    :forma_pagamento => 1,
    :tipo_pagamento => 'CartaoDeCredito',
    :email_consumidor => 'some@email.com'
  }
end

def moip_query_response
  {
    "ID"=>"201109300946542390000012428473", "Status"=>"Sucesso",
    "Autorizacao"=>{
      "Pagador"=>{
        "Nome"=>"Lorem Ipsum", "Email"=>"some@email.com"
      },
      "EnderecoCobranca"=>{
        "Logradouro"=>"Some Address ,999", "Numero"=>"999",
        "Complemento"=>"Address A", "Bairro"=>"Hello World", "CEP"=>"99999-000",
        "Cidade"=>"Some City", "Estado"=>"MG", "Pais"=>"BRA",
        "TelefoneFixo"=>"(31)3666-6666"
      },
      "Recebedor"=>{
        "Nome"=>"Happy Guy", "Email"=>"happy@email.com"
      },
      "Pagamento"=>{
        "Data"=>"2011-09-30T09:33:37.000-03:00", "TotalPago"=>"999.00", "TaxaParaPagador"=>"0.00",
        "TaxaMoIP"=>"19.37", "ValorLiquido"=>"979.63", "FormaPagamento"=>"BoletoBancario",
        "InstituicaoPagamento"=>"Itau", "Status"=>"BoletoImpresso", "CodigoMoIP"=>"0000.0728.5285"
      }
    }
  }
end

def moip_query_response_with_array
  {
    "ID"=>"201109300946542390000012428473", "Status"=>"Sucesso",
    "Autorizacao"=>{
      "Pagador"=>{
        "Nome"=>"Lorem Ipsum", "Email"=>"some@email.com"
      },
      "EnderecoCobranca"=>{
        "Logradouro"=>"Some Address ,999", "Numero"=>"999",
        "Complemento"=>"Address A", "Bairro"=>"Hello World", "CEP"=>"99999-000",
        "Cidade"=>"Some City", "Estado"=>"MG", "Pais"=>"BRA",
        "TelefoneFixo"=>"(31)3666-6666"
      },
      "Recebedor"=>{
        "Nome"=>"Happy Guy", "Email"=>"happy@email.com"
      },
      "Pagamento"=>[{
        "Data"=>"2011-09-30T09:33:37.000-03:00", "TotalPago"=>"999.00", "TaxaParaPagador"=>"0.00",
        "TaxaMoIP"=>"19.37", "ValorLiquido"=>"979.63", "FormaPagamento"=>"BoletoBancario",
        "InstituicaoPagamento"=>"Itau", "Status"=>"BoletoImpresso", "CodigoMoIP"=>"0000.0728.5285"
      }]
    }
  }
end