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

ActiveRecord::Schema.define(version: 2019_09_19_123116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achats", force: :cascade do |t|
    t.text "description"
    t.string "quantite"
    t.string "prix"
    t.datetime "date"
    t.string "lieu"
    t.bigint "user_id"
    t.bigint "region_id"
    t.bigint "produit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_authenticate"
    t.index ["produit_id"], name: "index_achats_on_produit_id"
    t.index ["region_id"], name: "index_achats_on_region_id"
    t.index ["user_id"], name: "index_achats_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
  end

  create_table "conversatons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_prives", force: :cascade do |t|
    t.text "content"
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_read"
    t.index ["recipient_id"], name: "index_message_prives_on_recipient_id"
    t.index ["sender_id"], name: "index_message_prives_on_sender_id"
  end

  create_table "produits", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signal_achats", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "achat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achat_id"], name: "index_signal_achats_on_achat_id"
    t.index ["user_id"], name: "index_signal_achats_on_user_id"
  end

  create_table "signalls", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_signalls_on_user_id"
    t.index ["vente_id"], name: "index_signalls_on_vente_id"
  end

  create_table "user_providers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "ville"
    t.text "description"
    t.string "email"
    t.string "encrypted_password"
    t.boolean "is_admin"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "contact"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ventes", force: :cascade do |t|
    t.text "description"
    t.string "quantite"
    t.string "prix"
    t.datetime "date"
    t.string "lieu"
    t.bigint "user_id"
    t.bigint "region_id"
    t.bigint "produit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_authenticate"
    t.index ["produit_id"], name: "index_ventes_on_produit_id"
    t.index ["region_id"], name: "index_ventes_on_region_id"
    t.index ["user_id"], name: "index_ventes_on_user_id"
  end

  add_foreign_key "achats", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "signal_achats", "achats"
  add_foreign_key "signal_achats", "users"
  add_foreign_key "signalls", "users"
  add_foreign_key "signalls", "ventes"
  add_foreign_key "user_providers", "users"
  add_foreign_key "ventes", "users"
end
