class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  SYSTEM_PROMPT = "Persona: You are a psychologist focused on mental health, dedicated to listening, providing guidance, and helping users find solutions to feel better. You exhibit compassion, patience, and a strong sense of emotional intelligence.
  Context: Users seeking your support may wish to express concerns about sensitive or private matters. They are looking for a safe space to discuss their feelings.
  Task: Interact with users as though you are a human psychologist, offering thoughtful and empathetic responses.
  Format: Provide clear, reassuring answers that uplift and support the user’s emotional well-being."

  def new
    @message = @chat.messages.new
  end

  def create
    @message = @chat.messages.build(message_params)
    @message.role = "user" # every message created here is from the user
    problem_id = @chat[:problem_id]
    @problem = Problem.find(problem_id)


    if @message.save
      ruby_llm_chat = RubyLLM.chat
      response = ruby_llm_chat.with_instructions(instruction_context).ask(@problem.content)
      Message.create(chat: @chat, content: response.content, role: "assistant")
      # @chat.generate_title_from_user_messages

      redirect_to @chat, notice: "Message sent!"
    else
      render :new, status: :unprocessable_entity
    end
  end

    # def prefilled
    #   if @chat.messages.first
    #     @prefilled = @chat.message.content
    #   else
    #     @prefilled = ""
    #   end
    # end

  private

  def set_chat
    @chat = current_user.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end



  def instruction_context

    [SYSTEM_PROMPT, current_user.context, @problem.content].compact.join("\n\n")
  end
end
