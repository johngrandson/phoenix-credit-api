defmodule CreditLimitApi.DirectoryTest do
  use CreditLimitApi.DataCase

  alias CreditLimitApi.Directory

  describe "credit_limit_request_logs" do
    alias CreditLimitApi.Directory.CreditLimitRequestLog

    @valid_attrs %{agreement_name: "some agreement_name", lot_id: 42}
    @update_attrs %{agreement_name: "some updated agreement_name", lot_id: 43}
    @invalid_attrs %{agreement_name: nil, lot_id: nil}

    def credit_limit_request_log_fixture(attrs \\ %{}) do
      {:ok, credit_limit_request_log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_credit_limit_request_log()

      credit_limit_request_log
    end

    test "list_credit_limit_request_logs/0 returns all credit_limit_request_logs" do
      credit_limit_request_log = credit_limit_request_log_fixture()
      assert Directory.list_credit_limit_request_logs() == [credit_limit_request_log]
    end

    test "get_credit_limit_request_log!/1 returns the credit_limit_request_log with given id" do
      credit_limit_request_log = credit_limit_request_log_fixture()
      assert Directory.get_credit_limit_request_log!(credit_limit_request_log.id) == credit_limit_request_log
    end

    test "create_credit_limit_request_log/1 with valid data creates a credit_limit_request_log" do
      assert {:ok, %CreditLimitRequestLog{} = credit_limit_request_log} = Directory.create_credit_limit_request_log(@valid_attrs)
      assert credit_limit_request_log.agreement_name == "some agreement_name"
      assert credit_limit_request_log.lot_id == 42
    end

    test "create_credit_limit_request_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_credit_limit_request_log(@invalid_attrs)
    end

    test "update_credit_limit_request_log/2 with valid data updates the credit_limit_request_log" do
      credit_limit_request_log = credit_limit_request_log_fixture()
      assert {:ok, %CreditLimitRequestLog{} = credit_limit_request_log} = Directory.update_credit_limit_request_log(credit_limit_request_log, @update_attrs)
      assert credit_limit_request_log.agreement_name == "some updated agreement_name"
      assert credit_limit_request_log.lot_id == 43
    end

    test "update_credit_limit_request_log/2 with invalid data returns error changeset" do
      credit_limit_request_log = credit_limit_request_log_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_credit_limit_request_log(credit_limit_request_log, @invalid_attrs)
      assert credit_limit_request_log == Directory.get_credit_limit_request_log!(credit_limit_request_log.id)
    end

    test "delete_credit_limit_request_log/1 deletes the credit_limit_request_log" do
      credit_limit_request_log = credit_limit_request_log_fixture()
      assert {:ok, %CreditLimitRequestLog{}} = Directory.delete_credit_limit_request_log(credit_limit_request_log)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_credit_limit_request_log!(credit_limit_request_log.id) end
    end

    test "change_credit_limit_request_log/1 returns a credit_limit_request_log changeset" do
      credit_limit_request_log = credit_limit_request_log_fixture()
      assert %Ecto.Changeset{} = Directory.change_credit_limit_request_log(credit_limit_request_log)
    end
  end
end
