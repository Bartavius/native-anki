# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data (optional - comment out in production)
UserQuestionProgress.destroy_all
UserLessonProgress.destroy_all
MultipleChoiceAnswer.destroy_all
MultipleChoiceQuestion.destroy_all
Question.destroy_all
Draw.destroy_all
Flashcard.destroy_all
ShortAnswer.destroy_all
Lesson.destroy_all
User.destroy_all

# Create Users
user1 = User.find_or_create_by!(username: 'student1') do |u|
  u.email = 'student1@example.com'
  u.password = 'password123'
end

user2 = User.find_or_create_by!(username: 'student2') do |u|
  u.email = 'student2@example.com'
  u.password = 'password123'
end

# Create Lessons
lesson1 = Lesson.find_or_create_by!(lesson_id: 'lesson-hiragana-basics') do |l|
  l.title = 'Hiragana Basics'
  l.description = <<~MARKDOWN
    # Introduction to Hiragana
    
    Hiragana is one of the three Japanese writing systems. In this lesson, you'll learn:
    - The five vowels: あ (a), い (i), う (u), え (e), お (o)
    - Basic consonant combinations
    - Stroke order and pronunciation
  MARKDOWN
end

lesson2 = Lesson.find_or_create_by!(lesson_id: 'lesson-katakana-basics') do |l|
  l.title = 'Katakana Basics'
  l.description = <<~MARKDOWN
    # Introduction to Katakana
    
    Katakana is used for foreign words and emphasis. Learn:
    - The five vowels in katakana
    - Common foreign word patterns
    - Writing conventions
  MARKDOWN
end

lesson3 = Lesson.find_or_create_by!(lesson_id: 'lesson-basic-kanji') do |l|
  l.title = 'Basic Kanji'
  l.description = <<~MARKDOWN
    # First 10 Kanji Characters
    
    Start your kanji journey with these fundamental characters:
    - Numbers: 一、二、三
    - Nature: 山、川、木
    - People: 人、日、月、火
  MARKDOWN
end

# Create Flashcards
flashcard1 = Flashcard.find_or_create_by!(id: 'fc-hiragana-a') do |f|
  f.front = 'あ'
  f.back = 'a (as in "father")'
end

flashcard2 = Flashcard.find_or_create_by!(id: 'fc-hiragana-i') do |f|
  f.front = 'い'
  f.back = 'i (as in "easy")'
end

flashcard3 = Flashcard.find_or_create_by!(id: 'fc-kanji-mountain') do |f|
  f.front = '山'
  f.back = 'mountain (yama)'
end

# Create Draw exercises
draw1 = Draw.find_or_create_by!(draw_id: 'draw-hiragana-a') do |d|
  d.image_url = 'https://example.com/strokes/hiragana-a.png'
  d.description = 'あ (a) - Practice stroke order'
end

draw2 = Draw.find_or_create_by!(draw_id: 'draw-kanji-mountain') do |d|
  d.image_url = 'https://example.com/strokes/kanji-mountain.png'
  d.description = '山 (mountain) - Three strokes'
end

# Create Multiple Choice Questions
mcq1 = MultipleChoiceQuestion.find_or_create_by!(mcq_id: 'mcq-hiragana-ka') do |m|
  m.prompt = 'Which hiragana character represents the sound "ka"?'
  m.correct_answer_id = 'ans-mcq1-correct'
end

# Create answers for MCQ1
MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq1-correct') do |a|
  a.question_id = 'mcq-hiragana-ka'
  a.text = 'か'
end

MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq1-wrong1') do |a|
  a.question_id = 'mcq-hiragana-ka'
  a.text = 'き'
end

MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq1-wrong2') do |a|
  a.question_id = 'mcq-hiragana-ka'
  a.text = 'く'
end

MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq1-wrong3') do |a|
  a.question_id = 'mcq-hiragana-ka'
  a.text = 'け'
end

mcq2 = MultipleChoiceQuestion.find_or_create_by!(mcq_id: 'mcq-kanji-one') do |m|
  m.prompt = 'What is the meaning of the kanji 一?'
  m.correct_answer_id = 'ans-mcq2-correct'
end

# Create answers for MCQ2
MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq2-correct') do |a|
  a.question_id = 'mcq-kanji-one'
  a.text = 'One'
end

MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq2-wrong1') do |a|
  a.question_id = 'mcq-kanji-one'
  a.text = 'Two'
end

MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq2-wrong2') do |a|
  a.question_id = 'mcq-kanji-one'
  a.text = 'Three'
end

MultipleChoiceAnswer.find_or_create_by!(answer_id: 'ans-mcq2-wrong3') do |a|
  a.question_id = 'mcq-kanji-one'
  a.text = 'Ten'
end

# Create Short Answer Questions
short_answer1 = ShortAnswer.find_or_create_by!(short_answer_id: 'sa-hiragana-greeting') do |s|
  s.prompt = 'Write "konnichiwa" (hello) in hiragana'
  s.correct_answer = 'こんにちは'
end

short_answer2 = ShortAnswer.find_or_create_by!(short_answer_id: 'sa-kanji-river') do |s|
  s.prompt = 'What is the reading of 川 in "kawa" (river)?'
  s.correct_answer = 'かわ'
end

# Create Questions (linking to specific question types)
Question.find_or_create_by!(question_id: 'fc-hiragana-a') do |q|
  q.lesson_id = 'lesson-hiragana-basics'
  q.question_type = 'flashcard'
end

Question.find_or_create_by!(question_id: 'fc-hiragana-i') do |q|
  q.lesson_id = 'lesson-hiragana-basics'
  q.question_type = 'flashcard'
end

Question.find_or_create_by!(question_id: 'draw-hiragana-a') do |q|
  q.lesson_id = 'lesson-hiragana-basics'
  q.question_type = 'draw'
end

Question.find_or_create_by!(question_id: 'mcq-hiragana-ka') do |q|
  q.lesson_id = 'lesson-hiragana-basics'
  q.question_type = 'multiple_choice'
end

Question.find_or_create_by!(question_id: 'sa-hiragana-greeting') do |q|
  q.lesson_id = 'lesson-hiragana-basics'
  q.question_type = 'short_answer'
end

Question.find_or_create_by!(question_id: 'fc-kanji-mountain') do |q|
  q.lesson_id = 'lesson-basic-kanji'
  q.question_type = 'flashcard'
end

Question.find_or_create_by!(question_id: 'draw-kanji-mountain') do |q|
  q.lesson_id = 'lesson-basic-kanji'
  q.question_type = 'draw'
end

Question.find_or_create_by!(question_id: 'mcq-kanji-one') do |q|
  q.lesson_id = 'lesson-basic-kanji'
  q.question_type = 'multiple_choice'
end

Question.find_or_create_by!(question_id: 'sa-kanji-river') do |q|
  q.lesson_id = 'lesson-basic-kanji'
  q.question_type = 'short_answer'
end

# Create User Lesson Progress
UserLessonProgress.find_or_create_by!(username: 'student1', lesson_id: 'lesson-hiragana-basics') do |ulp|
  ulp.last_reviewed = 2.days.ago
end

UserLessonProgress.find_or_create_by!(username: 'student1', lesson_id: 'lesson-basic-kanji') do |ulp|
  ulp.last_reviewed = 1.day.ago
end

UserLessonProgress.find_or_create_by!(username: 'student2', lesson_id: 'lesson-hiragana-basics') do |ulp|
  ulp.last_reviewed = 3.days.ago
end

# Create User Question Progress
UserQuestionProgress.find_or_create_by!(username: 'student1', question_id: 'fc-hiragana-a') do |uqp|
  uqp.last_reviewed = 2.days.ago
  uqp.times_reviewed = 5
  uqp.number_correct = 4
end

UserQuestionProgress.find_or_create_by!(username: 'student1', question_id: 'mcq-hiragana-ka') do |uqp|
  uqp.last_reviewed = 1.day.ago
  uqp.times_reviewed = 3
  uqp.number_correct = 2
end

UserQuestionProgress.find_or_create_by!(username: 'student1', question_id: 'fc-kanji-mountain') do |uqp|
  uqp.last_reviewed = 1.day.ago
  uqp.times_reviewed = 2
  uqp.number_correct = 2
end

UserQuestionProgress.find_or_create_by!(username: 'student2', question_id: 'fc-hiragana-a') do |uqp|
  uqp.last_reviewed = 3.days.ago
  uqp.times_reviewed = 8
  uqp.number_correct = 7
end

UserQuestionProgress.find_or_create_by!(username: 'student2', question_id: 'draw-hiragana-a') do |uqp|
  uqp.last_reviewed = 3.days.ago
  uqp.times_reviewed = 4
  uqp.number_correct = 3
end

puts "✅ Seeded database successfully!"
puts "Created:"
puts "  - #{User.count} users"
puts "  - #{Lesson.count} lessons"
puts "  - #{Question.count} questions"
puts "  - #{Flashcard.count} flashcards"
puts "  - #{MultipleChoiceQuestion.count} multiple choice questions"
puts "  - #{ShortAnswer.count} short answer questions"
puts "  - #{Draw.count} draw exercises"
puts "  - #{UserLessonProgress.count} user lesson progress records"
puts "  - #{UserQuestionProgress.count} user question progress records"


