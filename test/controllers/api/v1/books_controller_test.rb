require "test_helper"

class Api::V1::BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_book = api_v1_books(:one)
  end

  test "should get index" do
    get api_v1_books_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_book_url
    assert_response :success
  end

  test "should create api_v1_book" do
    assert_difference("Api::V1::Book.count") do
      post api_v1_books_url, params: { api_v1_book: { archived: @api_v1_book.archived, author: @api_v1_book.author, description: @api_v1_book.description, old: @api_v1_book.old, publication_year: @api_v1_book.publication_year, title: @api_v1_book.title } }
    end

    assert_redirected_to api_v1_book_url(Api::V1::Book.last)
  end

  test "should show api_v1_book" do
    get api_v1_book_url(@api_v1_book)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_book_url(@api_v1_book)
    assert_response :success
  end

  test "should update api_v1_book" do
    patch api_v1_book_url(@api_v1_book), params: { api_v1_book: { archived: @api_v1_book.archived, author: @api_v1_book.author, description: @api_v1_book.description, old: @api_v1_book.old, publication_year: @api_v1_book.publication_year, title: @api_v1_book.title } }
    assert_redirected_to api_v1_book_url(@api_v1_book)
  end

  test "should destroy api_v1_book" do
    assert_difference("Api::V1::Book.count", -1) do
      delete api_v1_book_url(@api_v1_book)
    end

    assert_redirected_to api_v1_books_url
  end
end
