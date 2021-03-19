# frozen_string_literal: true

namespace :dev do
  task roles: :environment do
    roles = %i[
      admin
      teacher
      nde
      coordinator
      center_director
      pro_rector
    ]

    spinner = TTY::Spinner.new(':spinner Creating roles', format: :bouncing_ball)
    spinner.auto_spin

    roles.each do |role|
      Role.create(name: role)
    end

    spinner.success('(successful)')
  end
  desc 'Create user for each role'
  task users: :environment do
    roles = %i[
      admin
      teacher
      nde
      coordinator
      center_director
      pro_rector
    ]

    spinner = TTY::Spinner.new(':spinner Creating user for each role', format: :bouncing_ball)
    spinner.auto_spin

    roles.each do |role|
      user = User.create(name: Faker::Name.first_name, email: "#{role}@example.com", password: 'password')
      role = Role.create(name: role)

      user.roles << role
    end

    spinner.success('(successful)')
  end

  desc 'Create Category > SubCategory > Axis > Subject'
  task categories: :environment do
    spinner = TTY::Spinner.new(':spinner Creating Category > SubCategory > Axis > Subject', format: :bouncing_ball)
    spinner.auto_spin

    categories = [
      'Conhecimentos Básicos',
      'Modelagem e Simulação',
      'Engenharia e Banco de Dados',
      'Redes e Sistemas Operacionais',
      'Sistemas Inteligentes'
    ]

    axes = [
      'Algoritmos de Alto Desempenho',
      'Ciência, Tecnologia e Sociedade',
      'Sistemas de Software',
      'Infraestrutura de Sistemas Computacionais'
    ]

    subjects = [
      'Cálculo',
      'Geometria Analítica',
      'Álgebra Linear',
      'Probabilidade e Estatística',
      'Matemática Discreta',
      'Lógica Matemática',
      'Pesquisa Operacional',
      'Cálculo Numérico',
      'Física',
      'Algoritmos e Estruturas de Dados',
      'Projeto e Análise de Algoritmos',
      'Programação Estruturada',
      'Programação Orientada a Objetos',
      'Programação Funcional',
      'Programação Web',
      'Programação para Dispositivos ',
      'Engenharia de Software',
      'Banco de Dados',
      'Gerência de Projetos',
      'Arquitetura de Computadores',
      'Sistemas Digitais',
      'Sistemas Operacionais',
      'Redes de Computadores',
      'Compiladores',
      'Teoria da Computação',
      'Sistemas Inteligentes',
      'Robótica',
      'Computação Gráfica',
      'Processamento de Sinais'
    ]

    axis_subject_algoritmo_desempenho = [
      'Cálculo', 'Geometria Analítica', 'Álgebra Linear', 'Matemática Discreta', 'Pesquisa Operacional',
      'Algoritmos e Estruturas de Dados', 'Projeto e Análise de Algoritmos', 'Teoria da Computação',
      'Sistemas Inteligentes', 'Computação Gráfica', 'Processamento de Sinais'
    ]
    axis_subject_ciencia_tec_soci = [
      'Probabilidade e Estatística', 'Cálculo Numérico'
    ]
    axis_subject_sistema_software = [
      'Lógica Matemática', 'Programação Estruturada', 'Programação Orientada a Objetos',
      'Programação Funcional', 'Programação Web', 'Programação para Dispositivos Móveis',
      'Engenharia de Software', 'Banco de Dados', 'Gerência de Projetos'
    ]

    # Create categories
    categories.each do |category|
      Category.create(name: category)
    end

    # Create axes
    axes.each do |axis|
      Axis.create(name: axis)
    end

    category_subject_conhecimentos_basicos = [
      'Cálculo',
      'Geometria Analítica',
      'Álgebra Linear',
      'Probabilidade e Estatística',
      'Matemática Discreta',
      'Lógica Matemática',
      'Pesquisa Operacional',
      'Algoritmos e Estruturas de Dados',
      'Projeto e Análise de Algoritmos',
      'Programação Estruturada',
      'Programação Orientada a Objetos',
      'Programação Funcional',
      'Programação Web',
      'Programação para Dispositivos Móveis',
      'Arquitetura de Computadores',
      'Sistemas Digitais '
    ]

    category_subject_modelagem_simluacao = [
      'Cálculo Numérico',
      'Física',
      'Compcategory_iladores',
      'Teoria da Computação',
      'Robótica',
      'Computação Gráfica',
      'Processamento de Sinais'
    ]

    category_subject_engenharia_banco_dados = [
      'Engenharia de Software',
      'Banco de Dados',
      'Gerência de Projetos'
    ]
    category_subject_redes_e_sistemas_op = [
      'Sistemas Operacionais',
      'Redes de Computadores'
    ]

    # category_subject_sistema_inteligente = [
    #   'Sistemas Inteligentes'
    # ]

    # Create subjects
    subjects.each do |subject|
      if subject.in?(axis_subject_algoritmo_desempenho)
        if subject.in?(category_subject_conhecimentos_basicos)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Algoritmos de Alto Desempenho'),
                         category: Category.find_by(name: 'Conhecimentos Básicos'))
        elsif subject.in?(category_subject_modelagem_simluacao)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Algoritmos de Alto Desempenho'),
                         category: Category.find_by(name: 'Modelagem e Simulação'))
        elsif subject.in?(category_subject_engenharia_banco_dados)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Algoritmos de Alto Desempenho'),
                         category: Category.find_by(name: 'Engenharia e Banco de Dados'))
        elsif subject.in?(category_subject_redes_e_sistemas_op)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Algoritmos de Alto Desempenho'),
                         category: Category.find_by(name: 'Redes e Sistemas Operacionais'))
        else
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Algoritmos de Alto Desempenho'),
                         category: Category.find_by(name: 'Sistemas Inteligentes'))
        end

      elsif subject.in?(axis_subject_ciencia_tec_soci)
        if subject.in?(category_subject_conhecimentos_basicos)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Ciência, Tecnologia e Sociedade'),
                         category: Category.find_by(name: 'Conhecimentos Básicos'))
        elsif subject.in?(category_subject_modelagem_simluacao)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Ciência, Tecnologia e Sociedade'),
                         category: Category.find_by(name: 'Modelagem e Simulação'))
        elsif subject.in?(category_subject_engenharia_banco_dados)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Ciência, Tecnologia e Sociedade'),
                         category: Category.find_by(name: 'Engenharia e Banco de Dados'))
        elsif subject.in?(category_subject_redes_e_sistemas_op)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Ciência, Tecnologia e Sociedade'),
                         category: Category.find_by(name: 'Redes e Sistemas Operacionais'))
        else
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Ciência, Tecnologia e Sociedade'),
                         category: Category.find_by(name: 'Sistemas Inteligentes'))
        end

      elsif subject.in?(axis_subject_sistema_software)
        if subject.in?(category_subject_conhecimentos_basicos)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Sistemas de Software'),
                         category: Category.find_by(name: 'Conhecimentos Básicos'))
        elsif subject.in?(category_subject_modelagem_simluacao)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Sistemas de Software'),
                         category: Category.find_by(name: 'Modelagem e Simulação'))
        elsif subject.in?(category_subject_engenharia_banco_dados)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Sistemas de Software'),
                         category: Category.find_by(name: 'Engenharia e Banco de Dados'))
        elsif subject.in?(category_subject_redes_e_sistemas_op)
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Sistemas de Software'),
                         category: Category.find_by(name: 'Redes e Sistemas Operacionais'))
        else
          Subject.create(name: subject,
                         axis: Axis.find_by(name: 'Sistemas de Software'),
                         category: Category.find_by(name: 'Sistemas Inteligentes'))
        end

      elsif subject.in?(category_subject_conhecimentos_basicos)
        Subject.create(name: subject,
                       axis: Axis.find_by(name: 'Infraestrutura de Sistemas Computacionais'),
                       category: Category.find_by(name: 'Conhecimentos Básicos'))
      elsif subject.in?(category_subject_modelagem_simluacao)
        Subject.create(name: subject,
                       axis: Axis.find_by(name: 'Infraestrutura de Sistemas Computacionais'),
                       category: Category.find_by(name: 'Modelagem e Simulação'))
      elsif subject.in?(category_subject_engenharia_banco_dados)
        Subject.create(name: subject,
                       axis: Axis.find_by(name: 'Infraestrutura de Sistemas Computacionais'),
                       category: Category.find_by(name: 'Engenharia e Banco de Dados'))
      elsif subject.in?(category_subject_redes_e_sistemas_op)
        Subject.create(name: subject,
                       axis: Axis.find_by(name: 'Infraestrutura de Sistemas Computacionais'),
                       category: Category.find_by(name: 'Redes e Sistemas Operacionais'))
      else
        Subject.create(name: subject,
                       axis: Axis.find_by(name: 'Infraestrutura de Sistemas Computacionais'),
                       category: Category.find_by(name: 'Sistemas Inteligentes'))
      end
    end
    spinner.success('(successful)')
  end

  desc 'Reset database and run seeds'
  task setup: :environment do
    spinner = TTY::Spinner.new(':spinner Dropping database', format: :bouncing_ball)
    spinner.auto_spin
    `rails db:drop`
    spinner.success('(successful)')

    spinner = TTY::Spinner.new(':spinner Creating database', format: :bouncing_ball)
    spinner.auto_spin
    `rails db:create`
    spinner.success('(successful)')

    spinner = TTY::Spinner.new(':spinner Running database migrations', format: :bouncing_ball)
    spinner.auto_spin
    `rails db:migrate`
    spinner.success('(successful)')

    `rails dev:users`
    `rails dev:questions`
    `rails dev:categories`
  end
end
