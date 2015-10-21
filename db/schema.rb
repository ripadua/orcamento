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

ActiveRecord::Schema.define(version: 20151021134205) do

# Could not dump table "clientes" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "orcamento_servicos", force: :cascade do |t|
    t.integer  "orcamento_id"
    t.integer  "servico_id"
    t.integer  "quantidade"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "orcamento_servicos", ["orcamento_id"], name: "index_orcamento_servicos_on_orcamento_id"
  add_index "orcamento_servicos", ["servico_id"], name: "index_orcamento_servicos_on_servico_id"

  create_table "orcamentos", force: :cascade do |t|
    t.date     "data"
    t.integer  "cliente_id"
    t.string   "descricao"
    t.string   "forma_pagamento"
    t.string   "observacoes"
    t.date     "validade"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orcamentos", ["cliente_id"], name: "index_orcamentos_on_cliente_id"

  create_table "servicos", force: :cascade do |t|
    t.string   "nome"
    t.string   "unidade"
    t.decimal  "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nome"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
