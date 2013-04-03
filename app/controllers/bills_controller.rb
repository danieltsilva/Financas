class BillsController < ApplicationController
  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.where("ISNULL(paid) AND approved = TRUE")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bills }
    end
  end

  # GET /bills/requests
  # GET /bills/requests.json
  def requests
    @bills = Bill.where :approved => false

    respond_to do |format|
      format.html # requests.html.erb
      format.json { render json: @bills }
    end
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill }
    end
  end

  # GET /bills/new
  # GET /bills/new.json
  def new
    @bill = Bill.new
    @bill.paid = false
    @bill.approved = false

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bill }
    end
  end

  # GET /bills/1/edit
  def edit
    @bill = Bill.find(params[:id])
  end

  def pay
    @bill = Bill.find(params[:id])
    @accounts = Account.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill  }
    end
  end

  def payexec
    @bill = Bill.find(params[:id])
    @account = Account.find(params[:account_id])

    @transaction = Transaction.new
    @transaction.date = @bill.payment_date
    #@transaction.category = @bill.category
    @transaction.number = @bill.number
    @transaction.description = "Pagamento de Conta"
    @transaction.amount = -1.0 * @bill.amount
    @transaction.account = @account

    @transaction.save

    @bill.paid = true
    @bill.save

    respond_to do |format|
      format.html { redirect_to bills_url }
      format.json { head :no_content }
    end
  end

  # GET /bills/approve
  # GET /bills/approve.json
  def approve
    @bill = Bill.find(params[:id])

    respond_to do |format|
      format.html # approve.html.erb
      format.json { render json: @bill }
    end
  end

  # GET /bills/requests
  # GET /bills/requests.json
  def approveexec
    @bill = Bill.find(params[:id])
    @bill.approved = true

    @bill.save

    respond_to do |format|
      format.html { redirect_to "/bills/requests" }
      format.json { render json: @bill }
    end
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(params[:bill])

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render json: @bill, status: :created, location: @bill }
      else
        format.html { render action: "new" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bills/1
  # PUT /bills/1.json
  def update
    @bill = Bill.find(params[:id])

    respond_to do |format|
      if @bill.update_attributes(params[:bill])
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy

    respond_to do |format|
      format.html { redirect_to bills_url }
      format.json { head :no_content }
    end
  end
end
