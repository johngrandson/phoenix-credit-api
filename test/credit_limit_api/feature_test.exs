defmodule CreditLimitApi.FeatureTest do
  use CreditLimitApi.DataCase

  alias CreditLimitApi.Feature

  describe "logs" do
    alias CreditLimitApi.Feature.Log

    @valid_attrs %{agreement_name: "some agreement_name", lot_id: 42}
    @update_attrs %{agreement_name: "some updated agreement_name", lot_id: 43}
    @invalid_attrs %{agreement_name: nil, lot_id: nil}

    def log_fixture(attrs \\ %{}) do
      {:ok, log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Feature.create_log()

      log
    end

    test "list_logs/0 returns all logs" do
      log = log_fixture()
      assert Feature.list_logs() == [log]
    end

    test "get_log!/1 returns the log with given id" do
      log = log_fixture()
      assert Feature.get_log!(log.id) == log
    end

    test "create_log/1 with valid data creates a log" do
      assert {:ok, %Log{} = log} = Feature.create_log(@valid_attrs)
      assert log.agreement_name == "some agreement_name"
      assert log.lot_id == 42
    end

    test "create_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feature.create_log(@invalid_attrs)
    end

    test "update_log/2 with valid data updates the log" do
      log = log_fixture()
      assert {:ok, %Log{} = log} = Feature.update_log(log, @update_attrs)
      assert log.agreement_name == "some updated agreement_name"
      assert log.lot_id == 43
    end

    test "update_log/2 with invalid data returns error changeset" do
      log = log_fixture()
      assert {:error, %Ecto.Changeset{}} = Feature.update_log(log, @invalid_attrs)
      assert log == Feature.get_log!(log.id)
    end

    test "delete_log/1 deletes the log" do
      log = log_fixture()
      assert {:ok, %Log{}} = Feature.delete_log(log)
      assert_raise Ecto.NoResultsError, fn -> Feature.get_log!(log.id) end
    end

    test "change_log/1 returns a log changeset" do
      log = log_fixture()
      assert %Ecto.Changeset{} = Feature.change_log(log)
    end
  end
end
