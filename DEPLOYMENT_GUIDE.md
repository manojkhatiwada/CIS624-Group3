 # Azure VM Deployment Guide - Screenshot Instructions

This document provides detailed instructions for taking the required screenshots for your assignment.

## Assignment Requirements Checklist

You need to provide:
1. ✅ Terraform files (main.tf, variables.tf, outputs.tf, cloud-init.yml)
2. ✅ Word document with the following screenshots

## Screenshot Guide

### Screenshot 1: Resource Does NOT Exist (BEFORE Deployment)

**When to take**: Before running `terraform apply`

**Steps**:
1. Open Azure Portal (https://portal.azure.com)
2. Click on "Resource groups" in the left menu
3. In the search box, type "simple-web-rg"
4. **Take screenshot showing**:
   - The search box with "simple-web-rg"
   - Empty results or "No resource groups found"
   - Your Azure username/account visible in top right

**Example labels to add to Word doc**:
```
Figure 1: Azure Portal showing resource group 'simple-web-rg' does NOT exist before deployment
```

---

### Screenshot 2: Terraform Plan Command

**When to take**: After running `terraform plan`

**Steps**:
1. Open your terminal
2. Navigate to the Terraform directory
3. Run:
   ```bash
   terraform plan
   ```
4. **Take screenshot showing**:
   - The command you typed: `terraform plan`
   - The plan output showing resources to be created
   - Summary at the bottom (e.g., "Plan: 8 to add, 0 to change, 0 to destroy")

**Example labels**:
```
Figure 2: Terraform plan command output showing 8 resources will be created
```

---

### Screenshot 3: Terraform Apply Command

**When to take**: During `terraform apply` execution

**Steps**:
1. Run:
   ```bash
   terraform apply
   ```
2. When prompted, type `yes`
3. **Take screenshot showing**:
   - The command: `terraform apply`
   - The confirmation prompt and your "yes" response
   - The resources being created (in progress or completed)
   - The final "Apply complete!" message
   - The outputs (public_ip_address, website_url, etc.)

**Tip**: You might need 2 screenshots - one showing the prompt and one showing completion

**Example labels**:
```
Figure 3a: Terraform apply command execution and confirmation
Figure 3b: Terraform apply completion with outputs
```

---

### Screenshot 4: Resource Exists in Azure Portal (AFTER Deployment)

**When to take**: After `terraform apply` completes successfully

**Steps**:
1. Go back to Azure Portal
2. Click "Resource groups"
3. Click on "simple-web-rg"
4. **Take screenshot showing**:
   - Resource group name "simple-web-rg"
   - All resources listed (should see: VM, disk, network interface, NSG, public IP, virtual network, subnet)
   - Resource count (should show 7-8 resources)

**Example labels**:
```
Figure 4: Azure Portal showing resource group 'simple-web-rg' with all deployed resources
```

---

### Screenshot 5: Virtual Machine Details

**When to take**: After deployment

**Steps**:
1. In Azure Portal, within the "simple-web-rg" resource group
2. Click on the Virtual Machine "simpleweb-vm"
3. **Take screenshot showing**:
   - VM name: "simpleweb-vm"
   - Status: "Running"
   - Public IP address
   - Operating system: Ubuntu
   - Size: Standard_B1s

**Example labels**:
```
Figure 5: Virtual Machine 'simpleweb-vm' running with public IP address
```

---

### Screenshot 6: Website Running in Browser

**When to take**: After deployment (wait 2-3 minutes for cloud-init to complete)

**Steps**:
1. Copy the public IP address from Terraform output or Azure Portal
2. Open a web browser
3. Navigate to: `http://PUBLIC_IP_ADDRESS`
4. **Take screenshot showing**:
   - The URL bar with the public IP address
   - The complete HTML page with:
     - Title: "Welcome to My Azure VM!"
     - Purple gradient background
     - White container with deployment information
   - Full browser window

**Example labels**:
```
Figure 6: Simple HTML web page successfully deployed and accessible via public IP
```

---

### Screenshot 7: Terraform Destroy Command

**When to take**: When running `terraform destroy`

**Steps**:
1. In terminal, run:
   ```bash
   terraform destroy
   ```
2. When prompted, type `yes`
3. **Take screenshot showing**:
   - The command: `terraform destroy`
   - The confirmation prompt
   - Resources being destroyed
   - Final message: "Destroy complete! Resources: X destroyed."

**Example labels**:
```
Figure 7: Terraform destroy command execution showing all resources removed
```

---

### Screenshot 8: Resource Deleted in Azure Portal

**When to take**: After `terraform destroy` completes

**Steps**:
1. Return to Azure Portal
2. Go to "Resource groups"
3. Search for "simple-web-rg"
4. **Take screenshot showing**:
   - Search box with "simple-web-rg"
   - Message indicating resource group not found or empty list
   - Timestamp/date visible

**Example labels**:
```
Figure 8: Azure Portal confirming resource group 'simple-web-rg' has been deleted
```

---

## Word Document Structure

Create a Word document with the following structure:

```
Title Page:
  - Title: Azure VM Deployment with Terraform
  - Your Name
  - Course Name
  - Date

Section 1: Introduction
  - Brief description of what you deployed
  - Technologies used (Terraform, Azure, Ubuntu, Nginx)

Section 2: Pre-Deployment
  - Screenshot 1: Resource does NOT exist
  - Description: Explain this shows the starting state

Section 3: Deployment Process
  - Screenshot 2: Terraform plan
  - Description: Explain what terraform plan does
  - Screenshot 3: Terraform apply
  - Description: Explain the deployment process

Section 4: Post-Deployment Verification
  - Screenshot 4: Resource group in Azure
  - Screenshot 5: Virtual Machine details
  - Screenshot 6: Website in browser
  - Descriptions for each

Section 5: Cleanup
  - Screenshot 7: Terraform destroy
  - Screenshot 8: Resource deleted confirmation
  - Descriptions for each

Section 6: Conclusion
  - Summary of what was accomplished
  - Lessons learned
```

## Common Issues and Solutions

### Issue: Website not loading

**Solution**:
- Wait 2-3 minutes after deployment
- Check that cloud-init completed: SSH into VM and run `cloud-init status`
- Verify port 80 is open in NSG

### Issue: Terraform apply fails

**Solution**:
- Ensure you're logged into Azure: `az login`
- Check your subscription is active: `az account show`
- Verify the SSH public key is correct in terraform.tfvars

### Issue: Cannot SSH into VM

**Solution**:
- Verify you're using the correct private key file
- Check the public key matches in terraform.tfvars
- Use the exact command from Terraform output

## Tips for Better Screenshots

1. **Use full screen**: Capture the entire browser/terminal window
2. **Clear clutter**: Close unnecessary tabs or windows
3. **High resolution**: Use PNG format for clarity
4. **Add annotations**: Use Word's drawing tools to highlight important parts
5. **Consistent naming**: Name screenshots as Fig1.png, Fig2.png, etc.
6. **Timestamps**: Include timestamps where relevant (Azure Portal often shows them)

## File Submission Checklist

Before submitting, ensure you have:

- [ ] main.tf
- [ ] variables.tf
- [ ] outputs.tf
- [ ] cloud-init.yml
- [ ] terraform.tfvars (with your SSH key)
- [ ] Word document with all 8 screenshots
- [ ] Each screenshot is labeled and described
- [ ] Document is properly formatted

## Terraform Files Summary

Your submission should include these exact files:

1. **main.tf**: Contains all Azure resource definitions
2. **variables.tf**: Defines all input variables
3. **terraform.tfvars**: Your specific values (SSH key, region, etc.)
4. **outputs.tf**: Defines what information to display after deployment
5. **cloud-init.yml**: VM initialization script with HTML content

## Validation Before Submission

Run through this checklist:

1. ✅ All Terraform files are present
2. ✅ SSH public key is correctly set in terraform.tfvars
3. ✅ All 8 screenshots are captured
4. ✅ Screenshots are clear and readable
5. ✅ Each screenshot has a descriptive caption
6. ✅ Word document is properly formatted
7. ✅ You ran terraform destroy to avoid charges
8. ✅ Final verification screenshot shows resources deleted

## Additional Resources

- **Terraform Documentation**: https://www.terraform.io/docs
- **Azure VM Documentation**: https://docs.microsoft.com/en-us/azure/virtual-machines/
- **Cloud-Init Documentation**: https://cloudinit.readthedocs.io/

---

Good luck with your assignment! Make sure to destroy all resources after taking screenshots to avoid Azure charges.
