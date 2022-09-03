using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SupermercadosLaPoderosa.Models;

namespace SupermercadosLaPoderosa.Controllers
{
    public class IngredientesController : Controller
    {
        private LaPoderosaModelContainer db = new LaPoderosaModelContainer();

        // GET: Ingredientes
        public ActionResult Index()
        {
            var ingredientes = db.Ingredientes.Include(i => i.Receta).Include(i => i.Producto);
            return View(ingredientes.ToList());
        }

        // GET: Ingredientes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ingrediente ingrediente = db.Ingredientes.Find(id);
            if (ingrediente == null)
            {
                return HttpNotFound();
            }
            return View(ingrediente);
        }

        // GET: Ingredientes/Create
        public ActionResult Create()
        {
            ViewBag.RecetaId = new SelectList(db.Recetas, "Id", "Nombre");
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "NombreProducto");
            return View();
        }

        // POST: Ingredientes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Nombre,Porcion,RecetaId,ProductoId")] Ingrediente ingrediente)
        {
            if (ModelState.IsValid)
            {
                db.Ingredientes.Add(ingrediente);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.RecetaId = new SelectList(db.Recetas, "Id", "Nombre", ingrediente.RecetaId);
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "NombreProducto", ingrediente.ProductoId);
            return View(ingrediente);
        }

        // GET: Ingredientes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ingrediente ingrediente = db.Ingredientes.Find(id);
            if (ingrediente == null)
            {
                return HttpNotFound();
            }
            ViewBag.RecetaId = new SelectList(db.Recetas, "Id", "Nombre", ingrediente.RecetaId);
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "NombreProducto", ingrediente.ProductoId);
            return View(ingrediente);
        }

        // POST: Ingredientes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Nombre,Porcion,RecetaId,ProductoId")] Ingrediente ingrediente)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ingrediente).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.RecetaId = new SelectList(db.Recetas, "Id", "Nombre", ingrediente.RecetaId);
            ViewBag.ProductoId = new SelectList(db.Productos, "Id", "NombreProducto", ingrediente.ProductoId);
            return View(ingrediente);
        }

        // GET: Ingredientes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ingrediente ingrediente = db.Ingredientes.Find(id);
            if (ingrediente == null)
            {
                return HttpNotFound();
            }
            return View(ingrediente);
        }

        // POST: Ingredientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ingrediente ingrediente = db.Ingredientes.Find(id);
            db.Ingredientes.Remove(ingrediente);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
