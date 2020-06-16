<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Karyawan extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('id_user')) {
			redirect(site_url('auth'));
		}
		$this->load->helper('form');
		$this->load->model('M_Karyawan', 'mod');
		// $this->load->model('m_kategori');
		// $this->load->model('m_merk');
	}


	public function index()
	{
		$data['title']='Tabel karyawan';
		$data['result']=$this->mod->tampil_karyawan()['result'];
		$data['total_data']=$this->mod->tampil_karyawan()['total_data'];

		// print('<pre>'); print_r($data); exit();
		$this->parser->parse('karyawan/karyawan_tampil', $data);
	}

	public function tambah()
	{
		$data['title']='Tambah karyawan';
		$data['kodeunik'] = $this->mod->buat_kode();
		
		$this->parser->parse('karyawan/karyawan_tambah', $data);
	}

	public function tambah_proses()
	{
		$data=[
			"id_karyawan"	=> $this->input->post('id_karyawan'),
			"nama"	=> $this->input->post('nama'),
			"id_kategori"	=> $this->input->post('id_kategori'),
			"id_merk"	=> $this->input->post('id_merk'),
		];
		//print_r($_POST);
		$this->mod->tambah_karyawan($data);
		redirect(site_url('karyawan'));
	}

	public function ubah($id)
	{
		$data['title']='Ubah karyawan';
		$data['result']=$this->mod->detail_karyawan($id);
		$data['result_kategori_pilihan'] = $this->m_kategori->tampil_kategori_pilihan()['result'];
		$this->parser->parse('karyawan/karyawan_ubah', $data);	}

	public function ubah_proses()
	{
		$data=[
			"id_karyawan"	=> $this->input->post('id_karyawan'),
			"nama"	=> $this->input->post('nama'),
			"id_kategori"	=> $this->input->post('id_kategori'),
			"id_merk"	=> $this->input->post('id_merk'),

		];

		$this->mod->ubah_karyawan($data);
		redirect(site_url('karyawan'));
	}
	public function delete($id)
	{
		 $this->mod->delete($id);
		redirect(site_url('karyawan'));
	}
	
}

/* End of file karyawan.php */
/* Location: ./application/controllers/karyawan.php */