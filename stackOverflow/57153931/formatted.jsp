<nested:define property="overridesMap" id="overridesMap" />

<%
  Map      ovrMap      = (Map) overridesMap;
  Set      ovrSet      = ovrMap.keySet();
  Iterator ovrIterator = ovrSet.iterator();

  while (ovrIterator.hasNext()) {
    String          ovrKey             = (String) ovrIterator.next();
    String          ovrFieldValue      = "field(" + ovrKey + ")";

    OverrideDisplay display            = (OverrideDisplay) ovrMap.get(ovrKey);

    String          vfId               = "VF(" + display.getVendorFacility().getHashString() + ")";
    String          displayUpdateId    = vfId + ".updated";
    String          displayAddNewRowId = vfId + ".addNewRow";

    int             effCount           = 1;
    int             viewableRowCount   = 0;
%>

  <table class="displayTable" cellpadding="0" cellspacing="0">
    <nested:nest property="<%= ovrFieldValue %>">
      <%
        Map      effMap     = (Map) display.getEffectiveDateMap();
        Iterator effIter    = effMap.keySet().iterator();
      %>

      <%
        while (effIter.hasNext()) {
          String        effKey                     = (String)effIter.next();
          String        effFieldValue              = "field("+effKey+")";
          EffectiveDate effectiveDate              = (EffectiveDate)effMap.get(effKey);
          String        effectiveDateId            = vfIf + ".EF(" + effCount + ")";
          String        effectiveDateSelectId      = effectiveDateId + ".selected";
          String        effectiveDateUpdatedId     = effectiveDateId + ".updated";
          String        effectiveDateUpdatedTypeId = effectiveDateId + ".updateType";
          String        hiddenRowClass             = ((effectiveDate.getUpdateType() == EffectiveDate.DELETE) ||
                                                     (effectiveDate.isIntersect()) ||
                                                     (effectiveDate.isHideRow())) ? "hideRow" : "";

          if (hiddenRowClass.equals("")) {
            viewableRowCount++;
          }
      %>

      <nested:nest property="<%= effFieldValue %>">
        <tr class="<%= hiddenRowClass %>">
          <td class="rowData multiColumn rowSelectorCol">
              <nested:checkbox property="selected" styleId="selected" title="<%= effectiveDateSelectId %>"/>
              <nested:hidden property="rowNumber" />
              <nested:hidden property="intersect" />
              <nested:hidden property="hideRow" />
              <nested:hidden property="hasValidVF" />
              <nested:hidden property="hasErrors" />
              <nested:hidden property="updated" styleId="<%= effectiveDateUpdatedId %>" />
              <nested:hidden property="updateType" styleId="<%= effectiveDateUpdatedTypeId %>" />
          </td>

          <td class="rowData multiColumn errorCol">
            <nested:equal property="hasErrors" value="true">
              <nested:hidden property="errorDescription"/>
              <nested:define property="errorDescription" id="errDesc" />
              <span class="redX" title="<%= errDesc %>">X</span>
            </nested:equal>

            <nested:notEqual property="hasErrors" value="true">
              &nbsp;
            </nested:notEqual>
          </td>

          <td class="rowData multiColumn vendorCol">
            <% if ((viewableRowCount == 1) && (hiddenRowClass.equals(""))) { %>
              <nested:write property="../vendorFacility.masterVendor.vendorNumber" />
            <% } %>

            <% if (effCount == 1) { %>
              <nested:hidden property="../vendorFacility.vendor.vendorNumber" />
              <nested:hidden property="../vendorFacility.vendor.vendorDeptNumber" />
              <nested:hidden property="../vendorFacility.masterVendor.vendorNumber" />
              <nested:hidden property="../vendorFacility.masterVendor.vendorDeptNumber" />
              <nested:hidden property="../vendorFacility.isValid" />
              <nested:hidden property="../updated" styleId="<%= displayUpdateId %>"/>
              <nested:hidden property="../addNewRow" styleId="<%= displayAddNewRowId %>"/>
            <% } else { %>
              &nbsp;
            <% } %>
          </td>

          <td class="rowData multiColumn vendorNameCol">
            <% if ((viewableRowCount == 1) && (hiddenRowClass.equals(""))) { %>
              <nested:write property="../vendorFacility.masterVendor.vendorName" />
            <% } %>

            <%if (effCount == 1) { %>
              <nested:hidden property="../vendorFacility.vendor.vendorName" />
              <nested:hidden property="../vendorFacility.masterVendor.vendorName" />
            <% } else { %>
              &nbsp;
            <% } %>
          </td>

          <td class="rowData multiColumn facilityCol">
            <% if ((viewableRowCount == 1) && (hiddenRowClass.equals("")) ) { %>
              <nested:write property="../vendorFacility.facility.facilityNumber" />
            <% } %>

            <% if (effCount == 1) { %>
              <nested:hidden property="../vendorFacility.facility.facilityNumber" />
              <nested:hidden property="../vendorFacility.facility.facilityBUID" />
            <% } else { %>
              &nbsp;
            <% } %>
          </td>

          <td class="rowData multiColumn facilityNameCol">
            <% if ((viewableRowCount == 1) && (hiddenRowClass.equals("")) ) { %>
              <nested:write property="../vendorFacility.facility.facilityName" />
            <% } %>

            <% if (effCount == 1) { %>
              <nested:hidden property="../vendorFacility.facility.facilityName" />
            <% } else { %>
              &nbsp;
            <% } %>
          </td>

          <%
            Map      ovrRecMap  = (Map) effectiveDate.getOverrideRecordMap();
            Set      ovrRecSet  = ovrRecMap.keySet();
            Iterator ovrRecIter = ovrRecSet.iterator();

            while (ovrRecIter.hasNext()) {
              String         ovrRecKey        = (String) ovrRecIter.next();
              String         ovrRecFieldValue = "field(" + ovrRecKey + ")";
              OverrideRecord overrideRecord   = (OverrideRecord) ovrRecMap.get(ovrRecKey);
              String         systemDay        = overrideRecord.isSystemDay() ? "systemDay" : "";

              String ovrId         = effectiveDateId + ".OVR(" + overrideRecord.getDayOfWeek() + ")";
              String ovrUpdated    = ovrId + ".updated";
              String ovrUpdateType = ovrId + ".updateType";
              String ovrType       = ovrId + ".overrideType";
              String overrideId    = ovrId + ".overrideId";
          %>
              <nested:nest property="<%= ovrRecFieldValue %>">
                <nested:equal property="../active" value="true">
                  <td class="rowData multiColumn overrideCol <%= systemDay %>">
                    <nested:write property="overrideTypeDesc"/>
                    <nested:hidden property="overrideTypeDesc"/>
                    <nested:hidden property="dayOfWeek" />
                    <nested:hidden property="systemDay" />
                    <nested:hidden property="updated"  styleId="<%= ovrUpdated %>"/>
                    <nested:hidden property="overrideType" styleId="<%= ovrType %>" />
                    <nested:hidden property="updateType" styleId="<%= ovrUpdateType %>" />
                    <nested:hidden property="overrideId" styleId="<%= overrideId %>" />
                  </td>
                </nested:equal>

                <nested:notEqual property="../active" value="true">
                  <td class="rowData multiColumn overrideCol <%= systemDay %>">
                    <nested:equal property="systemDay" value="true">
                      <nested:select property="overrideType" styleClass="selectBox" styleId="<%= ovrType %>" onchange="javascript: registerChange('ovr', this);">
                        <html:option value="0">&nbsp;</html:option>
                        <html:option value="2">S</html:option>
                      </nested:select>
                    </nested:equal>

                    <nested:notEqual property="systemDay" value="true">
                      <nested:select property="overrideType" styleClass="selectBox" styleId="<%= ovrType %>" onchange="javascript: registerChange('ovr', this);">
                        <html:option value="0">&nbsp;</html:option>
                        <html:option value="1">A</html:option>
                      </nested:select>
                    </nested:notEqual>

                    <nested:hidden property="overrideTypeDesc"/>
                    <nested:hidden property="dayOfWeek" />
                    <nested:hidden property="systemDay" />
                    <nested:hidden property="updated" styleId="<%= ovrUpdated %>" />
                    <nested:hidden property="updateType" styleId="<%= ovrUpdateType %>" />
                    <nested:hidden property="overrideId" styleId="<%= overrideId %>" />
                  </td>
                </nested:notEqual>
              </nested:nest>
          <%  } %>

          <td class="rowData multiColumn dateCol">
            <nested:equal property="forEmptyVF" value="true">
              &nbsp;
            </nested:equal>

            <nested:notEqual property="forEmptyVF" value="true">
              <%
                String  startDateId      = effectiveDateId + ".start";
                String  startOnClickText = "javascript: openCalendar('" + startDateId + "', false); return false;";
                boolean disabled         = effectiveDate.isActive();
              %>
              <nested:text property="startDateText" styleClass="dateBox" maxlength="10" styleId="<%= startDateId %>" readonly="<%= disabled %>"  onchange="javascript: return registerChange('effDt', this);" />
              &nbsp;
              <html:image src="images/cal_icon.gif" styleClass="dateImage" onclick="<%= startOnClickText %>" disabled="<%= disabled %>" />
            </nested:notEqual>
          </td>

          <td class="rowData multiColumn dateCol">
            <nested:hidden property="active" />
            <nested:hidden property="forEmptyVF" />

            <nested:equal property="forEmptyVF" value="true">
              &nbsp;
            </nested:equal>

            <nested:notEqual property="forEmptyVF" value="true">
              <%
                String endDateId = effectiveDateId + ".end";
                String endOnClickText = "javascript: openCalendar('" + endDateId + "', false, true); return false;";
              %>

              <nested:text property="endDateText" styleClass="dateBox" maxlength="10" styleId="<%= endDateId %>" onchange="javascript: return registerChange('effDt', this);" />
              &nbsp;
              <html:image src="images/cal_icon.gif" styleClass="dateImage" onclick="<%= endOnClickText %>" />
            </nested:notEqual>
          </td>

          <td class="rowData multiColumn endRow actionCol">
            <nested:equal property="hasAddButton" value="true">
              <%
                String addOnClick = "javascript: submitForm('add'," + "'vf=" + display.getVendorFacility().getHashString() + "');";
              %>

              <span style="width: 40px;">
                <html:button property="add" value="Add" styleClass="addButton" onclick="<%= addOnClick %>" />
              </span>

              <nested:hidden property="hasAddButton" />
            </nested:equal>

            <nested:notEqual property="hasAddButton" value="true">
              <span style="width: 40px;">&nbsp;</span>
            </nested:notEqual>

            <nested:equal property="active" value="false">
              <%
                String deleteOnClick = "javascript: submitForm('delete'," + "'vf=" + display.getVendorFacility().getHashString() + "&" + "effDt=" + effectiveDate.getHashString()+ "');";
              %>
              <span style="width: 40px;">
                <html:button property="delete" value="Delete" styleClass="delButton" onclick="<%= deleteOnClick %>" />
              </span>
            </nested:equal>

            <nested:equal property="active" value="true">
              <span style="width: 40px;">&nbsp;</span>
            </nested:equal>
          </td>
        </tr>
      </nested:nest>
    <%
        effCount++;
      }
    %>

    </table>

    <br/>
  </nested:nest>
<%
  }
%>
