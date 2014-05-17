this.App ?= {}

App.bootstrap = ->
  for own index, question of questions
    App.QuestionCollection.insert
      _id: "#{index}"
      question: question
  undefined

questions = [
  "How old would you be if you didn’t know how old you are?"
  "Which is worse, failing or never trying?"
  "If life is so short, why do we do so many things we don’t like and like so many things we don’t do?"
  "When it’s all said and done, will you have said more than you’ve done?"
  "What is the one thing you’d most like to change about the world?"
  "If happiness was the national currency, what kind of work would make you rich?"
  "Are you doing what you believe in, or are you settling for what you are doing?"
  "If the average human life span was 40 years, how would you live your life differently?"
  "To what degree have you actually controlled the course your life has taken?"
  "Are you more worried about doing things right, or doing the right things?"
  "You’re having lunch with three people you respect and admire.  They all start criticizing a close friend of yours, not knowing she is your friend.  The criticism is distasteful and unjustified.  What do you do?"
  "If you could offer a newborn child only one piece of advice, what would it be?"
  "Would you break the law to save a loved one?"
  "Have you ever seen insanity where you later saw creativity?"
  "What’s something you know you do differently than most people?"
  "How come the things that make you happy don’t make everyone happy?"
  "What one thing have you not done that you really want to do?  What’s holding you back?"
  "Are you holding onto something you need to let go of?"
  "If you had to move to a state or country besides the one you currently live in, where would you move and why?"
  "Do you push the elevator button more than once?  Do you really believe it makes the elevator faster?"
  "Would you rather be a worried genius or a joyful simpleton?"
  "Why are you, you?"
  "Have you been the kind of friend you want as a friend?"
  "Which is worse, when a good friend moves away, or losing touch with a good friend who lives right near you?"
  "What are you most grateful for?"
  "Would you rather lose all of your old memories, or never be able to make new ones?"
  "Is is possible to know the truth without challenging it first?"
  "Has your greatest fear ever come true?"
  "Do you remember that time 5 years ago when you were extremely upset?  Does it really matter now?"
  "What is your happiest childhood memory?  What makes it so special?"
  "At what time in your recent past have you felt most passionate and alive?"
  "If not now, then when?"
  "If you haven’t achieved it yet, what do you have to lose?"
  "Have you ever been with someone, said nothing, and walked away feeling like you just had the best conversation ever?"
  "Why do religions that support love cause so many wars?"
  "Is it possible to know, without a doubt, what is good and what is evil?"
  "If you just won a million dollars, would you quit your job?"
  "Would you rather have less work to do, or more work you actually enjoy doing?"
  "Do you feel like you’ve lived this day a hundred times before?"
  "When was the last time you marched into the dark with only the soft glow of an idea you strongly believed in?"
  "If you knew that everyone you know was going to die tomorrow, who would you visit today?"
  "Would you be willing to reduce your life expectancy by 10 years to become extremely attractive or famous?"
  "What is the difference between being alive and truly living?"
  "When is it time to stop calculating risk and rewards, and just go ahead and do what you know is right?"
  "If we learn from our mistakes, why are we always so afraid to make a mistake?"
  "What would you do differently if you knew nobody would judge you?"
  "When was the last time you noticed the sound of your own breathing?"
  "What do you love?  Have any of your recent actions openly expressed this love?"
  "In 5 years from now, will you remember what you did yesterday?  What about the day before that?  Or the day before that?"
  "Decisions are being made right now.  The question is:  Are you making them for yourself, or are you letting others make them for you?"
  "What is the air-speed velocity of an unladen swallow?"
  ]



