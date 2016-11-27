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

ActiveRecord::Schema.define(version: 20161127105456) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "ads", force: :cascade do |t|
    t.string   "title",              limit: 100,               null: false
    t.text     "body",               limit: 65535,             null: false
    t.integer  "user_id",            limit: 4,                 null: false
    t.integer  "type",               limit: 4,                 null: false
    t.integer  "woeid_code",         limit: 4
    t.datetime "created_at",                                   null: false
    t.string   "ip",                 limit: 15
    t.string   "photo",              limit: 100
    t.integer  "status",             limit: 4,                 null: false
    t.integer  "comments_enabled",   limit: 4
    t.datetime "deleted_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "readed_count",       limit: 4
    t.integer  "comments_count",     limit: 4,     default: 0
    t.integer  "grams",              limit: 4
    t.date     "expiration_date"
    t.date     "pick_up_date"
    t.string   "slug",               limit: 255
    t.string   "zipcode",            limit: 255
    t.string   "province",           limit: 255
    t.string   "city",               limit: 255
    t.string   "food_category",      limit: 255
  end

  add_index "ads", ["deleted_at"], name: "index_ads_on_deleted_at", using: :btree
  add_index "ads", ["status"], name: "index_ads_on_status", using: :btree
  add_index "ads", ["woeid_code"], name: "woeid", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "body",               limit: 65535
    t.string   "category",           limit: 255
    t.datetime "published_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "video",              limit: 65535
    t.boolean  "pin"
    t.string   "slug",               limit: 255
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "avg",           limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commentable_type", limit: 255
    t.integer  "commentable_id",   limit: 4
    t.integer  "user_id",          limit: 4
    t.text     "body",             limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer "user_id",   limit: 4, null: false
    t.integer "friend_id", limit: 4, null: false
  end

  add_index "friendships", ["user_id", "friend_id"], name: "iduser_idfriend", unique: true, using: :btree

  create_table "ideas", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.text     "body",               limit: 65535
    t.string   "category",           limit: 255
    t.datetime "published_at"
    t.integer  "user_id",            limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "introduction",       limit: 65535
    t.text     "ingredients",        limit: 65535
    t.string   "slug",               limit: 255
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id",   limit: 4
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id",   limit: 4
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id", using: :btree
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "thread_id",  limit: 4,   default: 0
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 16777215
    t.string   "subject",              limit: 255,      default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                                 default: false
    t.datetime "updated_at",                                            null: false
    t.datetime "created_at",                                            null: false
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "notification_code",    limit: 255
    t.string   "attachment",           limit: 255
    t.boolean  "global",                                default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id",     limit: 4
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id", limit: 4,                   null: false
    t.boolean  "is_read",                     default: false
    t.boolean  "trashed",                     default: false
    t.boolean  "deleted",                     default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type", using: :btree

  create_table "messages_deleted", id: false, force: :cascade do |t|
    t.integer "id_user",    limit: 4, null: false
    t.integer "id_message", limit: 4, null: false
  end

  add_index "messages_deleted", ["id_user", "id_message"], name: "iduser_idmessage", unique: true, using: :btree

  create_table "messages_legacy", force: :cascade do |t|
    t.integer  "thread_id",   limit: 4,                     null: false
    t.datetime "created_at",                                null: false
    t.integer  "user_from",   limit: 4
    t.integer  "user_to",     limit: 4
    t.string   "ip",          limit: 15,                    null: false
    t.string   "subject",     limit: 100,                   null: false
    t.text     "body",        limit: 65535,                 null: false
    t.integer  "readed",      limit: 4,     default: 0,     null: false
    t.datetime "updated_at"
    t.boolean  "is_migrated",               default: false
  end

  add_index "messages_legacy", ["thread_id"], name: "thread_id", using: :btree
  add_index "messages_legacy", ["user_from"], name: "user_from", using: :btree
  add_index "messages_legacy", ["user_to"], name: "user_to", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "zipcode",            limit: 255
    t.text     "address",            limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "email",              limit: 255
    t.string   "phone",              limit: 255
    t.string   "website",            limit: 255
    t.string   "slug",               limit: 255
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "overall_avg",   limit: 24,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id",      limit: 4
    t.integer  "rateable_id",   limit: 4
    t.string   "rateable_type", limit: 255
    t.float    "stars",         limit: 24,  null: false
    t.string   "dimension",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id",   limit: 4
    t.string   "cacheable_type", limit: 255
    t.float    "avg",            limit: 24,  null: false
    t.integer  "qty",            limit: 4,   null: false
    t.string   "dimension",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "readedAdCount", primary_key: "id_ad", force: :cascade do |t|
    t.integer "counter", limit: 4, null: false
  end

  add_index "readedAdCount", ["id_ad", "counter"], name: "id_ad_counter", unique: true, using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "texts", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "body",         limit: 65535
    t.string   "code",         limit: 255
    t.datetime "published_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "threads", force: :cascade do |t|
    t.string  "subject",         limit: 100,             null: false
    t.integer "last_speaker",    limit: 4
    t.integer "unread",          limit: 4,   default: 0, null: false
    t.integer "conversation_id", limit: 4,   default: 0
  end

  add_index "threads", ["last_speaker"], name: "last_speaker", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 32,                   null: false
    t.string   "legacy_password_hash",   limit: 255
    t.string   "email",                  limit: 100,                  null: false
    t.date     "created_at",                                          null: false
    t.integer  "active",                 limit: 4,   default: 0,      null: false
    t.integer  "locked",                 limit: 4
    t.integer  "role",                   limit: 4,   default: 0,      null: false
    t.integer  "woeid",                  limit: 4,   default: 766273, null: false
    t.string   "lang",                   limit: 4,                    null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "ads_count",              limit: 4,   default: 0
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        limit: 4
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "name",                   limit: 255
    t.string   "zipcode",                limit: 255
    t.string   "province",               limit: 255
    t.string   "city",                   limit: 255
    t.boolean  "accept_mailing"
    t.string   "image_file_name",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size",        limit: 4
    t.datetime "image_updated_at"
    t.string   "auth_token",             limit: 255
    t.string   "fcm_registration_token", limit: 255
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
