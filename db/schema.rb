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

ActiveRecord::Schema.define(version: 20140113124323) do

  create_table "episodes", force: true do |t|
    t.integer  "patient_id"
    t.date     "data"
    t.string   "servico_referenciador"
    t.string   "primeiro_contacto"
    t.string   "orientacao"
    t.string   "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episodes", ["patient_id"], name: "index_episodes_on_patient_id"

  create_table "patients", force: true do |t|
    t.string   "nome"
    t.date     "data_de_nascimento"
    t.string   "estado_civil"
    t.string   "habilitacoes_literarios"
    t.string   "residencia"
    t.integer  "telefone"
    t.integer  "subsystem_id",                    limit: 255
    t.integer  "sistema_de_saude_numero"
    t.integer  "cartao_de_cidadao"
    t.integer  "numero_identificacao_fiscal"
    t.string   "nome_contacto_preferencial"
    t.integer  "telefone_contacto_preferencial"
    t.string   "morada_contacto_preferencial"
    t.integer  "telemovel_contacto_preferencial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsystems", force: true do |t|
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
