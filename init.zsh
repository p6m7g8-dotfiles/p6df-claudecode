# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::claudecode::deps()
#
#>
######################################################################
p6df::modules::claudecode::deps() {
  ModuleDeps=(
  )
}

######################################################################
#<
#
# Function: p6df::modules::claudecode::external::brew()
#
#>
######################################################################
p6df::modules::claudecode::external::brew() {

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::claudecode::home::symlink()
#
#>
######################################################################
p6df::modules::claudecode::home::symlink() {

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::claudecode::aliases::init()
#
#>
######################################################################
p6df::modules::claudecode::aliases::init() {

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::claudecode::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 CLAUDE_CODE_OAUTH_TOKEN P6_DFZ_PROFILE_CLAUDE
#>
######################################################################
p6df::modules::claudecode::prompt::mod() {

  local str
  if ! p6_string_blank "$P6_DFZ_PROFILE_CLAUDE"; then
    if ! p6_string_blank "$CLAUDE_CODE_OAUTH_TOKEN"; then
      str="claudecode:\t  $P6_DFZ_PROFILE_CLAUDE: oauth"
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::claudecode::profile::on(profile, [token=])
#
#  Args:
#	profile -
#	OPTIONAL token - []
#
#  Environment:	 CLAUDE_CODE_OAUTH_TOKEN P6_DFZ_PROFILE_CLAUDE
#>
######################################################################
p6df::modules::claudecode::profile::on() {
  local profile="$1"
  local token="${2:-}"

  p6_env_export "P6_DFZ_PROFILE_CLAUDE" "$profile"

  if ! p6_string_blank "$token"; then
    p6_env_export "CLAUDE_CODE_OAUTH_TOKEN" "$token"
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::claudecode::profile::off()
#
#  Environment:	 CLAUDE_CODE_OAUTH_TOKEN P6_DFZ_PROFILE_CLAUDE
#>
######################################################################
p6df::modules::claudecode::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_CLAUDE
  p6_env_export_un CLAUDE_CODE_OAUTH_TOKEN

  p6_return_void
}
