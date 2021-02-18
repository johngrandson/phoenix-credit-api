defmodule CreditLimitApiWeb.CreditLimitRequestLogControllerTest do
  use CreditLimitApiWeb.ConnCase

  alias CreditLimitApi.Directory
  alias CreditLimitApi.Directory.CreditLimitRequestLog

  @create_attrs %{
    agreement_name: "some agreement_name",
    lot_id: 42
  }
  @update_attrs %{
    agreement_name: "some updated agreement_name",
    lot_id: 43
  }
  @invalid_attrs %{agreement_name: nil, lot_id: nil}

  def fixture(:credit_limit_request_log) do
    {:ok, credit_limit_request_log} = Directory.create_credit_limit_request_log(@create_attrs)
    credit_limit_request_log
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all credit_limit_request_logs", %{conn: conn} do
      conn = get(conn, Routes.credit_limit_request_log_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create credit_limit_request_log" do
    test "renders credit_limit_request_log when data is valid", %{conn: conn} do
      conn = post(conn, Routes.credit_limit_request_log_path(conn, :create), credit_limit_request_log: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.credit_limit_request_log_path(conn, :show, id))

      assert %{
               "id" => id,
               "agreement_name" => "some agreement_name",
               "lot_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.credit_limit_request_log_path(conn, :create), credit_limit_request_log: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update credit_limit_request_log" do
    setup [:create_credit_limit_request_log]

    test "renders credit_limit_request_log when data is valid", %{conn: conn, credit_limit_request_log: %CreditLimitRequestLog{id: id} = credit_limit_request_log} do
      conn = put(conn, Routes.credit_limit_request_log_path(conn, :update, credit_limit_request_log), credit_limit_request_log: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.credit_limit_request_log_path(conn, :show, id))

      assert %{
               "id" => id,
               "agreement_name" => "some updated agreement_name",
               "lot_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, credit_limit_request_log: credit_limit_request_log} do
      conn = put(conn, Routes.credit_limit_request_log_path(conn, :update, credit_limit_request_log), credit_limit_request_log: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete credit_limit_request_log" do
    setup [:create_credit_limit_request_log]

    test "deletes chosen credit_limit_request_log", %{conn: conn, credit_limit_request_log: credit_limit_request_log} do
      conn = delete(conn, Routes.credit_limit_request_log_path(conn, :delete, credit_limit_request_log))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.credit_limit_request_log_path(conn, :show, credit_limit_request_log))
      end
    end
  end

  defp create_credit_limit_request_log(_) do
    credit_limit_request_log = fixture(:credit_limit_request_log)
    %{credit_limit_request_log: credit_limit_request_log}
  end
end
