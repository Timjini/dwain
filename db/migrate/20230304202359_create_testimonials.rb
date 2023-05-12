class CreateTestimonials < ActiveRecord::Migration[7.0]
  def change
    create_table :testimonials do |t|
      t.string :content
      t.string :person
      t.string :job

      t.timestamps
    end
  end
end
