require "./fruby.rb"
require "irb"

# include Fruby::Main
extend Fruby::Main

# y

def start_irb_session(binding)
  IRB.setup(nil)
  workspace = IRB::WorkSpace.new(binding)
  irb = IRB::Irb.new(workspace)

  IRB.conf[:MAIN_CONTEXT] = irb.context

  irb.eval_input
end

start_irb_session(binding)
