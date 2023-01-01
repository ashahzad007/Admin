using AdminWeb.Models;
using AdminWeb.Repositories.Contract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System;
using System.Dynamic;

namespace AdminWeb.Controllers
{
    // [Authorize(Roles = "Admin")]
    public class AssetMasterController : Controller
    {
        private readonly ILogger<AssetMasterController> _logger;

        private readonly IGenericRepository<AssetMaster> _assetMasterRepository;

        public AssetMasterController(ILogger<AssetMasterController> logger, IGenericRepository<AssetMaster> assetMasterRepository)
        {
            _logger = logger;
            _assetMasterRepository = assetMasterRepository;
        }

        public IActionResult Index()
        {
            return View();
        }

        // Main Tabs achieved with Expendo Object
        // Catch Lication Id here
        public ActionResult MainTab(int Id)
        {
            //PopulateTaxNatureList();
            //PopulateDocumentList();
            //ViewData["list"] = FillStatus();;
            dynamic mymodel = new ExpandoObject();
            mymodel.Location = new Location();
            mymodel.MethodType = "Create";
            mymodel.Person = new Person();
            mymodel.MethodType = "Create";
            mymodel.LocId = Id;
            // Location Id Catch from Location Controller.
            ViewBag.LocationIdX = Id;
            mymodel.Asset = new AssetMaster
           
            {
                //CreatedBy = User.Identity.Name,
                //CreatedDate = DateTime.Now

            };
           
            //mymodel.Taxlist = ViewBag.TaxNature;
            //mymodel.Statuslist = ViewData["list"];
            //mymodel.documentstypes = ViewBag.DoctypeID;
            // return partial view with Model, mymodel
            return PartialView("~/Views/Shared/MainTab.cshtml", mymodel);
        }



        [HttpGet]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetLocationList()
        {
            List<AssetMaster> _assetMasterList = await _assetMasterRepository.GetList();
            return View(_assetMasterList);
        }

        [HttpPost]

        //DATA FROM ADO.NET 
        public async Task<IActionResult> GetLocationList(string SerachTxt)
        {
            List<AssetMaster> _assetMasterList = await _assetMasterRepository.GetList();
            if (SerachTxt != null)
            {
                _assetMasterList = _assetMasterRepository.GetList().Result.Where(x => x.Address.Contains(SerachTxt)).ToList();
            }
            return View(_assetMasterList);
        }

        [HttpGet]
        public IActionResult SaveLocation()
        {

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SaveLocation(AssetMaster model)
        {
            bool _result = await _assetMasterRepository.Save(model);
            ModelState.Clear();
            return RedirectToAction("Index");
        }




        public IActionResult Privacy()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Edit(int id)
        {
            var row = _assetMasterRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [HttpPost]
        public async Task<IActionResult> Edit(int? id, AssetMaster model)
        {
            bool _result = await _assetMasterRepository.Edit(model);
            ModelState.Clear(); //CLEAR FORM DATA
            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult Delete(int? id)
        {
            var row = _assetMasterRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [HttpPost]
        public async Task<IActionResult> DeleteAsync(int? id, Person model)
        {
            bool _result = await _assetMasterRepository.Delete(id);
            ModelState.Clear(); //CLEAR FORM DATA
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            var row = _assetMasterRepository.GetList().Result.Find(x => x.Id == id);
            return View(row);
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}