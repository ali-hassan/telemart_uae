require 'spec_helper'

describe PersonViewUtils do
  it "#display_name" do
    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: "Johnny Walker",
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: true,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("Deleted user")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: "Johnny Walker",
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: true,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("Deleted user")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("John D")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("John D - ACCOUNT DISABLED")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: "first_name_only",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("John")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: "first_name_only",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("John - ACCOUNT DISABLED")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: "full_name",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("John Doe")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: "full_name",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("John Doe - ACCOUNT DISABLED")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: nil,
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("John D")

    expect(PersonViewUtils.display_name(
      first_name: "John",
      last_name: "Doe",
      display_name: nil,
      username: "johnd",
      name_display_type: nil,
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("John D - ACCOUNT DISABLED")

    expect(PersonViewUtils.display_name(
      first_name: nil,
      last_name: nil,
      display_name: nil,
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("johnd")

    expect(PersonViewUtils.display_name(
      first_name: nil,
      last_name: nil,
      display_name: nil,
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("johnd - ACCOUNT DISABLED")

    expect(PersonViewUtils.display_name(
      first_name: nil,
      last_name: nil,
      display_name: "Johnny Walker",
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: false,
      banned_text: '- ACCOUNT DISABLED')).to eql("Johnny Walker")

    expect(PersonViewUtils.display_name(
      first_name: nil,
      last_name: nil,
      display_name: "Johnny Walker",
      username: "johnd",
      name_display_type: "first_name_with_initial",
      is_deleted: false,
      deleted_user_text: "Deleted user",
      banned: true,
      banned_text: '- ACCOUNT DISABLED')).to eql("Johnny Walker - ACCOUNT DISABLED")
  end

  it "#person_entity_display_name" do
    expect(PersonViewUtils.person_entity_display_name(nil, "full_name"))
      .to eql(I18n.translate("common.removed_user"))
  end

  it "#person_display_name" do
    expect(PersonViewUtils.person_display_name(nil, Community.first))
      .to eql(I18n.translate("common.removed_user"))
  end
end
