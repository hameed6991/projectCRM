<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceRequestSummary.aspx.cs"
    Inherits="apa_pack.ServiceRequestSummary" %>
<!DOCTYPE html>
<html>
<head runat="server">
  <title>Service Request Summary</title>

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

  <style>
    /* Page shell */
    .card-soft { border-radius: 12px; box-shadow: 0 6px 16px rgba(0,0,0,.06); }
    .section-title { font-weight: 700; font-size: 1.05rem; color:#111827 }
    .muted { color:#6b7280; }

    /* Stepper */
    .stepper { display:flex; align-items:center; gap:28px; padding:16px 20px; }
    .step { display:flex; flex-direction:column; align-items:center; gap:8px; min-width:90px; }
    .dot { width:16px; height:16px; border-radius:50%; border:3px solid #cbd5e1; background:#fff; }
    .step.active .dot { border-color:#16a34a; background:#16a34a; }
    .step.done .dot { border-color:#0ea5e9; background:#0ea5e9; }
    .bar { flex:1; height:3px; background:#cbd5e1; }
    .bar.filled { background:#0ea5e9; }
    .step label { font-size:.75rem; color:#374151; text-align:center; white-space:nowrap; }

    /* Blue gadget header mimic */
    .gadget-head { background:#eff6ff; border-bottom:1px solid #e5e7eb; padding:10px 14px; border-radius:10px 10px 0 0; }
    .gadget-title { font-weight:600; color:#111827; }

    .pill { display:inline-block; padding:.15rem .55rem; font-size:.75rem; border-radius:999px; }
    .pill-open { background:#fee2e2; color:#b91c1c; border:1px solid #fecaca; }

    .btn-wide { min-width:210px; }
  </style>
    <style>
  /* Grid stepper: step, connector, step, connector… */
  .stepper{
    display:grid;
    grid-template-columns: repeat(9, 1fr); /* 5 steps + 4 connectors */
    align-items:center;
    gap:14px;
    padding:10px 6px;
  }
  .step{
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    gap:8px;
    min-width:0; /* prevents overflow */
    text-align:center;
  }
  .step label{
    font-size:.78rem;
    color:#374151;
    line-height:1.1;
    white-space:normal;
  }

  .dot{
    width:16px;height:16px;border-radius:50%;
    background:#fff;border:3px solid #cbd5e1; /* default */
  }
  .step.active .dot{background:#16a34a;border-color:#16a34a;} /* current step */
  .step.done   .dot{background:#0ea5e9;border-color:#0ea5e9;} /* finished */

  .connector{
    height:3px;width:100%;
    background:#e5e7eb;border-radius:999px;
  }
  .connector.filled{ background:#0ea5e9; }
</style>

</head>
<body>
  <form id="form1" runat="server">

    <div class="container-fluid py-3">

      <div class="d-flex align-items-center mb-3">
        <a href="ServiceRequest.aspx" class="btn btn-light border me-2"><i class="fa-solid fa-arrow-left"></i></a>
        <h4 class="m-0">Service Request Summary</h4>
        <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-dark ms-auto"
          Text="Edit" OnClick="btnEdit_Click" />
      </div>

      <!-- Row: Call details + status/activities -->
      <div class="row g-3">

        <!-- Left: Call Details -->
        <div class="col-lg-3">
          <div class="card card-soft">
            <div class="gadget-head"><span class="gadget-title">Call Details</span></div>
            <div class="card-body">
              <div class="row g-2 small">
                <div class="col-6 muted">Docket No</div><div class="col-6 fw-semibold text-end"><asp:Label runat="server" ID="lblDocketNo" /></div>
                <div class="col-6 muted">Call Date</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblCallDate" /></div>
                <div class="col-6 muted">Serial No</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblSerialNo" /></div>
                <div class="col-6 muted">Product</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblProduct" /></div>
                <div class="col-6 muted">Nature of Problem</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblNature" /></div>
                <div class="col-6 muted">Call Type</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblCallType" /></div>
                <div class="col-6 muted">Sub Call Type</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblSubCallType" /></div>
                <div class="col-6 muted">Service Code</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblServiceCode" /></div>
                <div class="col-6 muted">Status</div>
                <div class="col-6 text-end"><span class="pill pill-open"><asp:Label runat="server" ID="lblStatus" /></span></div>
                <div class="col-6 muted">Sub Status</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblSubStatus" /></div>
                <div class="col-6 muted">Source</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblSource" /></div>
                <div class="col-6 muted">Billable</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblBillable" /></div>
                <div class="col-12"><hr/></div>
                <div class="col-12 section-title">Account Info</div>
                <div class="col-6 muted">Account</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblAccount" /></div>
                <div class="col-6 muted">Address</div><div class="col-6 text-end"><asp:Label runat="server" ID="lblAddress" /></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Right: Status + activity -->
        <div class="col-lg-9">

          <!-- Ticket Status -->
    <!-- Ticket Status -->
<div class="card card-soft mb-3">
  <div class="gadget-head d-flex align-items-center">
    <span class="gadget-title">Ticket Status</span>
    <div class="ms-auto small text-muted">Target Response &amp; Resolution</div>
  </div>
  <div class="card-body">

    <!-- NEW: Grid-based stepper -->
    <div class="stepper" id="ticketStepper">
      <!-- Step 1 -->
      <div class="step" data-step="1">
        <span class="dot"></span>
        <label>Call Created</label>
      </div>
      <div class="connector" data-conn="1"></div>

      <!-- Step 2 -->
      <div class="step" data-step="2">
        <span class="dot"></span>
        <label>Allocated to Engineer</label>
      </div>
      <div class="connector" data-conn="2"></div>

      <!-- Step 3 -->
      <div class="step" data-step="3">
        <span class="dot"></span>
        <label>Follow Up</label>
      </div>
      <div class="connector" data-conn="3"></div>

      <!-- Step 4 -->
      <div class="step" data-step="4">
        <span class="dot"></span>
        <label>Repair Started</label>
      </div>
      <div class="connector" data-conn="4"></div>

      <!-- Step 5 -->
      <div class="step" data-step="5">
        <span class="dot"></span>
        <label>Completed</label>
      </div>
    </div>

  </div>
</div>


          <!-- Activity History -->
          <div class="card card-soft mb-3">
            <div class="gadget-head"><span class="gadget-title">Activity History</span></div>
            <div class="card-body">
              <asp:Repeater ID="rptActivity" runat="server">
                <HeaderTemplate>
                  <ul class="list-group list-group-flush">
                </HeaderTemplate>
                <ItemTemplate>
                  <li class="list-group-item d-flex align-items-start">
                    <i class="fa-solid fa-clock mt-1 me-2 text-secondary"></i>
                    <div class="flex-grow-1 small">
                      <div>
                        <strong><%# Eval("ActivityDate","{0:dd/MM/yyyy HH:mm}") %></strong>
                        – <span class="text-secondary">User:</span> <%# Eval("UserName") %>
                        – <span class="text-secondary">Status:</span> <%# Eval("Status") %>
                      </div>
                      <div class="text-secondary"><%# Eval("Description") %></div>
                    </div>
                  </li>
                </ItemTemplate>
                <FooterTemplate>
                  </ul>
                </FooterTemplate>
              </asp:Repeater>
            </div>
          </div>

          <!-- Contact & KPIs -->
          <div class="row g-3 mb-3">
            <div class="col-lg-6">
              <div class="card card-soft h-100">
                <div class="gadget-head"><span class="gadget-title">Primary Contact</span></div>
                <div class="card-body d-flex align-items-center gap-3">
                  <i class="fa-solid fa-user-circle fa-2x text-secondary"></i>
                  <div class="small">
                    <div class="fw-semibold"><asp:Label runat="server" ID="lblContactName" /></div>
                    <div class="text-secondary"><i class="fa-solid fa-phone me-1"></i><asp:Label runat="server" ID="lblContactPhone" /></div>
                    <div class="text-secondary"><i class="fa-solid fa-envelope me-1"></i><asp:Label runat="server" ID="lblContactEmail" /></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="card card-soft h-100">
                <div class="gadget-head"><span class="gadget-title">Activity Details</span></div>
                <div class="card-body small">
                  <div class="row g-2">
                    <div class="col-7 muted">Last Updated Activity (in days)</div><div class="col-5 text-end"><asp:Label runat="server" ID="lblLastActivityDays" /></div>
                    <div class="col-7 muted">Last Updated SubStatus</div><div class="col-5 text-end"><asp:Label runat="server" ID="lblLastSubStatus" /></div>
                    <div class="col-7 muted">Last Updated Comments</div><div class="col-5 text-end"><asp:Label runat="server" ID="lblLastComments" /></div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Actions -->
          <div class="card card-soft">
            <div class="card-body d-flex flex-wrap gap-2">
              <asp:Button ID="btnAllocate" runat="server" CssClass="btn btn-primary btn-wide" Text="Allocate to Engineer" OnClick="btnAllocate_Click" />
              <asp:Button ID="btnFollowUp" runat="server" CssClass="btn btn-info text-white btn-wide" Text="Follow Up" OnClick="btnFollowUp_Click" />
              <asp:Button ID="btnClosure" runat="server" CssClass="btn btn-success btn-wide" Text="Closure" OnClick="btnClosure_Click" />
              <asp:Button ID="btnRma" runat="server" CssClass="btn btn-outline-primary btn-wide" Text="RMA" OnClick="btnRma_Click" />
              <asp:Button ID="btnBill" runat="server" CssClass="btn btn-outline-dark btn-wide" Text="Bill Details" OnClick="btnBill_Click" />
              <asp:Button ID="btnQuote" runat="server" CssClass="btn btn-warning btn-wide" Text="Quotation Request" OnClick="btnQuote_Click" />
              <asp:Button ID="btnEngineerComments" runat="server" CssClass="btn btn-outline-secondary btn-wide" Text="Engineer Comments" OnClick="btnEngineerComments_Click" />
            </div>
          </div>

        </div>
      </div>
    </div>

    <!-- Hidden: current step (1..5) set in code-behind -->
    <asp:HiddenField runat="server" ID="hfStepIndex" />

    <script>
      (function () {
        var hf = document.getElementById("<%= hfStepIndex.ClientID %>");
            var idx = parseInt((hf && hf.value) || "1", 10);
            [1, 2, 3, 4, 5].forEach(function (s) {
                var step = document.getElementById("st" + s);
                if (!step) return;
                if (s < idx) step.classList.add("done");
                if (s === idx) step.classList.add("active");
                var bar = document.getElementById("b" + s);
                if (bar && s < idx) bar.classList.add("filled");
            });
        })();
    </script>

  </form>

  <!-- Bootstrap bundle -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
