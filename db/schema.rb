# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140211100047) do

  create_table "episodes", force: true do |t|
    t.integer  "patient_id"
    t.date     "data"
    t.integer  "unit_id",                 limit: 255
    t.string   "encaminhamento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id",              limit: 255
    t.date     "data_pedido_colaboracao"
    t.integer  "program_id"
    t.integer  "intervention_id"
    t.string   "diagnostico"
    t.integer  "user_id"
    t.boolean  "estado",                              default: false
  end

  add_index "episodes", ["patient_id"], name: "index_episodes_on_patient_id"

  create_table "finances", force: true do |t|
    t.integer  "patient_id"
    t.integer  "pension_id",  limit: 255
    t.integer  "montante"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habitationoccupations", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habitations", force: true do |t|
    t.integer  "patient_id"
    t.integer  "habitationtype_id",       limit: 255
    t.integer  "habitationoccupation_id", limit: 255
    t.integer  "numero_quartos"
    t.boolean  "sala"
    t.boolean  "casa_de_banho"
    t.boolean  "barreiras"
    t.boolean  "agua_canalizada"
    t.boolean  "electricidade"
    t.boolean  "esgotos"
    t.string   "estado_de_conservacao"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "morada"
    t.integer  "cpostal"
    t.integer  "cpostalext"
    t.string   "localidade"
    t.string   "meio_residencia"
  end

  create_table "habitationtypes", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interventions", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "nome"
    t.date     "data_de_nascimento"
    t.string   "estado_civil"
    t.string   "habilitacoes_literarios"
    t.string   "residencia"
    t.integer  "telefone"
    t.integer  "subsystem_id",                    limit: 255
    t.integer  "subsystem_number"
    t.integer  "cartao_de_cidadao"
    t.integer  "numero_identificacao_fiscal"
    t.string   "nome_contacto_preferencial"
    t.integer  "telefone_contacto_preferencial"
    t.string   "morada_contacto_preferencial"
    t.integer  "telemovel_contacto_preferencial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genero"
    t.integer  "rnu"
    t.string   "ocupacao"
  end

  add_index "patients", ["rnu"], name: "index_patients_on_rnu", unique: true

  create_table "patientshomes", force: true do |t|
    t.integer  "patient_id"
    t.string   "tipo_habitacao"
    t.string   "regime_de_ocupacao"
    t.string   "divisoes"
    t.string   "conforto_salubridade"
    t.string   "estado_de_conservacao"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patientshomes", ["patient_id"], name: "index_patientshomes_on_patient_id"

  create_table "pensions", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socialfamilies", force: true do |t|
    t.integer  "patient_id"
    t.string   "companhia"
    t.string   "apoio"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "socialfamilyhelp_id"
  end

  add_index "socialfamilies", ["patient_id"], name: "index_socialfamilies_on_patient_id"

  create_table "socialfamilyhelps", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsystems", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "nome"
    t.integer  "numero_mecanografico"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "auth"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["numero_mecanografico"], name: "index_users_on_numero_mecanografico", unique: true

end
