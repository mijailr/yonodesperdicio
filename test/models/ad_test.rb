# encoding : utf-8
require "test_helper"

class AdTest < ActiveSupport::TestCase

  setup do
    @ad = FactoryGirl.create(:ad)
    I18n.default_locale = :es
  end

  test "ad requires everything" do
    a = Ad.new
    a.valid?
    assert a.errors[:status].include?("no puede estar en blanco")
    assert a.errors[:body].include?("no puede estar en blanco")
    assert a.errors[:title].include?("no puede estar en blanco")
    assert a.errors[:user_id].include?("no puede estar en blanco")
    assert a.errors[:type].include?("no puede estar en blanco")
    assert a.errors[:woeid_code].include?("no puede estar en blanco")
    assert a.errors[:ip].include?("no puede estar en blanco")
  end

  test "ad validates type" do
    # only is allowed "1 2"
    @ad.type = 1
    assert @ad.valid?
    assert_equal @ad.type, 1
    @ad.type = 2
    assert @ad.valid?
    assert_equal @ad.type, 2
    @ad.type = 3
    @ad.valid?
    assert @ad.errors[:type].include?("no es un tipo válido")
  end

  test "ad validates status" do
    # only is allowed "1 2 3"
    @ad.status = 1
    assert @ad.valid?
    assert_equal @ad.status, 1
    @ad.status = 2
    assert @ad.valid?
    assert_equal @ad.status, 2
    @ad.status = 3
    assert @ad.valid?
    assert_equal @ad.status, 3
    @ad.status = 4
    @ad.valid?
    assert @ad.errors[:status].include?("no es un estado válido")
  end

  test "ad validates lenght" do
    @ad.title = "a" * 200
    assert_not @ad.save
    assert @ad.errors[:title].include?("es demasiado largo (100 caracteres máximo)")
  end

  test "ad escaped title and body with escape_privacy_data" do
    text = "contactar por email example@example.com, por sms 999999999, o whatsapp al 666666666"
    expected_text = "contactar por email  , por sms  , o whatsapp al  "
    @ad.update_attribute(:body, text)
    @ad.update_attribute(:title, text)
    assert_equal(@ad.body, expected_text)
    assert_equal(@ad.title, expected_text)
  end

  test "ad check slug" do
    assert_equal @ad.slug, "ordenador-en-vallecas"
  end

  test "ad check type_string" do
    assert_equal @ad.type_string, "regalo"
    @ad.type = 2
    @ad.save
    assert_equal @ad.type_string, "busco"
  end

  test "ad check status_string" do
    assert_equal @ad.status_string, "disponible"
    @ad.status = 2
    @ad.save
    assert_equal @ad.status_string, "reservado"
    @ad.status = 3
    @ad.save
    assert_equal @ad.status_string, "entregado"
  end

  test "ad check type_class" do
    assert_equal @ad.type_class, "give"
    @ad.type = 2
    @ad.save
    assert_equal @ad.type_class, "want"
  end

  test "ad check status_class" do
    assert_equal @ad.status_class, "available"
    @ad.status = 2
    @ad.save
    assert_equal @ad.status_class, "booked"
    @ad.status = 3
    @ad.save
    assert_equal @ad.status_class, "delivered"
  end

  test "ad is_give? or is_want?" do
    @ad.type = 1
    @ad.save
    assert_equal @ad.is_give?, true
    @ad.type = 2
    @ad.save
    assert_equal @ad.is_want?, true
  end

  test "ad meta_title" do
    @ad.type = 1
    @ad.save
    assert_equal @ad.meta_title, "compartir comida ordenador en Vallecas Madrid, Madrid, España"
    @ad.type = 2
    @ad.save
    assert_equal @ad.meta_title, "compartir comida ordenador en Vallecas Madrid, Madrid, España"
  end
end

