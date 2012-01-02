# encoding: utf-8

class AttendsController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create, :show]
  # GET /attends
  # GET /attends.json
  def index
    @attends = Attend.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attends }
    end
  end

  # GET /attends/1
  # GET /attends/1.json
  def show
    @attend = Attend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attend }
    end
  end

  # GET /attends/new
  # GET /attends/new.json
  def new
    @attend = Attend.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attend }
    end
  end

  # GET /attends/1/edit
  def edit
    @attend = Attend.find(params[:id])
  end

  # POST /attends
  # POST /attends.json
  def create
    @attend = Attend.new(params[:attend])

    respond_to do |format|
      if @attend.save
        AtndNotifier.received(@attend).deliver
        format.html { redirect_to @attend, notice: '参加登録を受付いたしました！' }
        format.json { render json: @attend, status: :created, location: @attend }

        p "call format"
      else
        format.html { render action: "new" }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attends/1
  # PUT /attends/1.json
  def update
    @attend = Attend.find(params[:id])

    respond_to do |format|
      if @attend.update_attributes(params[:attend])
        format.html { redirect_to @attend, notice: '登録に成功しました。' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attends/1
  # DELETE /attends/1.json
  def destroy
    @attend = Attend.find(params[:id])
    @attend.destroy

    respond_to do |format|
      format.html { redirect_to attends_url }
      format.json { head :ok }
    end
  end

  def truncate
    Attend.delete_all
    redirect_to attends_url
  end

  def csv
    csv_string = CSV.generate do |csv|
        csv << ['名前', 'メール', '領収書宛名', 'LT登壇', '懇親会参加', 'その他']
      Attend.find(:all).each do |u|
        csv << [u.name, u.mail, u.receipt_name, u.be_lightning, u.be_party, u.other]
      end
    end
    send_data(csv_string, :type=>'text/csv', :filename=>'clrhatnd.csv')
  end
end
