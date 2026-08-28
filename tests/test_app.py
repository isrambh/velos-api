import unittest
import app


class TestAPI(unittest.TestCase):

    def setUp(self):
        self.client = app.app.test_client()

    def test_sante(self):
        reponse = self.client.get("/sante")
        self.assertEqual(reponse.status_code, 200)
        self.assertEqual(reponse.get_json(), {"statut": "ok"})

    def test_alertes(self):
        reponse = self.client.get("/alertes")
        self.assertEqual(reponse.status_code, 200)
        donnees = reponse.get_json()
        self.assertIn("source", donnees)
        self.assertEqual(donnees["source"], "memoire")


if __name__ == "__main__":
    unittest.main()
