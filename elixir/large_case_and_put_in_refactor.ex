defp update_plan_with_ref(plan, ref) do
  case ref do
    %{id_qualifier: :alternative_list_id, id: id} ->
      put_in(plan[:plan][:formulary][:alternative_id], id)

    %{id_qualifier: :copay_id, id: id} ->
      put_in(plan[:plan][:formulary][:copay_id], id)

    %{id_qualifier: :coverage_list_id, id: id} ->
      put_in(plan[:plan][:formulary][:coverage_id], id)

    %{id_qualifier: :drug_formulary_number_id, id: id} ->
      put_in(plan[:plan][:formulary][:formulary_id], id)

    %{id_qualifier: :plan_id, id: id} ->
      put_in(plan[:plan][:account][:plan_number], id)

    %{id_qualifier: :group_number, id: id, description: group_name} ->
      plan = put_in(plan[:plan][:account][:group_name], group_name)
      put_in(plan[:plan][:account][:group_number], id)

    %{id_qualifier: :group_number, id: id} ->
      plan = put_in(plan[:plan][:account][:group_name], nil)
      put_in(plan[:plan][:account][:group_number], id)

    %{id_qualifier: :plan_name, id: id} ->
      put_in(plan[:plan][:account][:group_number], id)

    _ ->
      plan
  end
end

defp update_plan_with_ref(plan, ref) do
  plan_path = case ref.id_qualifier do
    :id_qualifier ->
      ~w(formulary alternative_id)a
    :copay_id ->
      ~w(formulary copay_id)a
    # ...
    :group_number: ->
      # Get ref[:description] or nil
      plan = put_in(plan, ~w(plan account group_name), the_value)
      ~w(account group_number)a
  end

  plan
  |> put_in([:plan | plan_path], id)
end
