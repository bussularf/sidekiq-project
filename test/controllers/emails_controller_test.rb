require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get emails_new_url
    assert_response :success
  end

  test "should create email and redirect with notice" do
    user = users(:one)
    post send_email_url, params: { user_id: user.id, subject: "Test Subject", body: "Test Body" }

    assert_redirected_to root_path

    follow_redirect!
    assert_response :success
    assert_select "div.alert", text: "E-mail enviado com sucesso!"
  end


  test "should redirect with error notice when user_id is blank" do
    post send_email_url, params: { subject: "Test Subject", body: "Test Body" }
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    assert_select "div.alert", text: "Por favor, selecione um usuário antes de enviar o e-mail."
  end
end
