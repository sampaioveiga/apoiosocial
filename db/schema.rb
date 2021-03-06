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

ActiveRecord::Schema.define(version: 20140409083358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.string   "nome"
    t.string   "morada"
    t.string   "localidade"
    t.integer  "telefone"
    t.integer  "telemovel"
    t.string   "email"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["patient_id"], name: "index_contacts_on_patient_id", using: :btree

  create_table "episodes", force: true do |t|
    t.integer  "patient_id"
    t.date     "data"
    t.date     "data_pedido_colaboracao"
    t.integer  "unit_id"
    t.integer  "service_id"
    t.integer  "program_id"
    t.integer  "intervention_id"
    t.integer  "user_id"
    t.boolean  "estado",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "diagnostico"
    t.text     "encaminhamento"
  end

  add_index "episodes", ["patient_id"], name: "index_episodes_on_patient_id", using: :btree

  create_table "finances", force: true do |t|
    t.integer  "patient_id"
    t.integer  "pension_id"
    t.integer  "montante"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "insuficiencia_economica"
    t.date     "data_consulta_rnu"
    t.date     "data_validade"
  end

  add_index "finances", ["patient_id"], name: "index_finances_on_patient_id", using: :btree

  create_table "habitationoccupations", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habitations", force: true do |t|
    t.integer  "patient_id"
    t.integer  "habitationtype_id"
    t.integer  "habitationoccupation_id"
    t.integer  "numero_quartos"
    t.boolean  "sala"
    t.boolean  "casa_de_banho"
    t.boolean  "barreiras"
    t.boolean  "agua_canalizada"
    t.boolean  "electricidade"
    t.boolean  "esgotos"
    t.string   "estado_de_conservacao"
    t.string   "morada"
    t.integer  "cpostal"
    t.integer  "cpostalext"
    t.string   "localidade"
    t.string   "meio_residencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "observacoes"
  end

  add_index "habitations", ["patient_id"], name: "index_habitations_on_patient_id", using: :btree

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

  create_table "notes", force: true do |t|
    t.date     "data"
    t.integer  "episode_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "nota"
  end

  create_table "patients", force: true do |t|
    t.string   "nome"
    t.date     "data_de_nascimento"
    t.string   "estado_civil"
    t.string   "habilitacoes_literarios"
    t.string   "residencia"
    t.integer  "telefone"
    t.integer  "subsystem_id"
    t.integer  "cartao_de_cidadao"
    t.integer  "numero_identificacao_fiscal"
    t.string   "genero"
    t.integer  "rnu"
    t.string   "ocupacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "telemovel"
    t.integer  "subsystem_number",            limit: 8
    t.integer  "niss",                        limit: 8
  end

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
    t.integer  "socialfamilyhelp_id"
    t.string   "companhia"
    t.string   "apoio"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "socialfamilies", ["patient_id"], name: "index_socialfamilies_on_patient_id", using: :btree

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

end
